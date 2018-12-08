# GitHub Actions for NPM

This Action for [auto-release](https://github.com/lisowski/auto-release) enables auto releases and PR validation with the `auto-release` command-line client, including publishing to a registry .

## Usage

An example workflow to build, test, and publish an npm package to the default public registry follows:

```hcl
workflow "AutoRelease" {
  on = "merge"
  resolves = ["Release Filter"]
}

workflow "AutoValidate" {
  on = "push"
  resolves = ["PR Validate"]
}

action "Release Filter" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Release" {
  needs = ["Release Filter"]
  uses = "lisowski/auto-release@master"
  args = "shipit"
}

action "PR Validate" {
  uses = "lisowski/auto-release@master"
  args = "validate"
}
```

### Secrets

- `NPM_AUTH_TOKEN` - **Optional**. The token to use for authentication with the npm registry. Required for `npm publish` ([more info](https://docs.npmjs.com/getting-started/working_with_tokens))

### Environment variables

- `NPM_REGISTRY_URL` - **Optional**. To specify a registry to authenticate with. Defaults to `registry.npmjs.org`
- `NPM_CONFIG_USERCONFIG` - **Optional**. To specify a non-default per-user configuration file. Defaults to `$HOME/.npmrc` ([more info](https://docs.npmjs.com/misc/config#npmrc-files))

#### Example

To authenticate with, and publish to, a registry other than `registry.npmjs.org`:

```hcl
action "Publish" {
  uses = "actions/npm@master"
  args = "publish --access public"
  env = {
    NPM_REGISTRY_URL = "someOtherRegistry.someDomain.net"
  }
  secrets = ["NPM_AUTH_TOKEN"]
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
