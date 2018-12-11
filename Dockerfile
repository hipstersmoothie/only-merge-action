FROM debian:stable-slim

LABEL version="1.0.0"
LABEL repository="http://github.com/hipstersmoothie/only-merge-action"
LABEL homepage="http://github.com/hipstersmoothie/only-merge-action"
LABEL maintainer="Andrew Lisowski <lisowski54@gmail.com>"

LABEL com.github.actions.name="Filter for only merges"
LABEL com.github.actions.description="Filter for only merges"
LABEL com.github.actions.icon="filter"
LABEL com.github.actions.color="gray-dark"

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        jq git && \
	apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

COPY LICENSE README.md THIRD_PARTY_NOTICE.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
