FROM debian:stable-slim

LABEL version="1.0.0"
LABEL repository="http://github.com/hipstersmoothie/only-merge-action"
LABEL homepage="http://github.com/hipstersmoothie/only-merge-action"
LABEL maintainer="Andrew Lisowski <lisowski54@gmail.com>"

LABEL com.github.actions.name="Filter for only merges"
LABEL com.github.actions.description="Filter for only merges"
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"

ENV PATH="/usr/local/bin:${PATH}"

RUN which ls
RUN ls .
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /
COPY bin /usr/local/bin/
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
