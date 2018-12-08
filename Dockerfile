FROM node:10-slim

LABEL version="1.0.0"
LABEL repository="http://github.com/hipstersmoothie/auto-release-actions"
LABEL homepage="http://github.com/hipstersmoothie/auto-release-actions"
LABEL maintainer="Andrew Lisowski <lisowski54@gmail.com>"

LABEL com.github.actions.name="GitHub Action for auto-release"
LABEL com.github.actions.description="Wraps the auto-release CLI to enable common auto-releases."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

RUN sudo apt-get update
RUN sudo apt-get install -y git

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
