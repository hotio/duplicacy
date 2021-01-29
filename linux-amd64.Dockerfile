FROM ghcr.io/hotio/base@sha256:e4b441eeb9faf8ab5fee10395a92f4965ae1945bd427af6049e48c5b47a475e9

EXPOSE 3875

VOLUME ["/cache","/logs"]

RUN mkdir "/var/lib/dbus" && ln -s "${CONFIG_DIR}/machine-id" "/var/lib/dbus/machine-id" && \
    ln -s "${CONFIG_DIR}/" "${APP_DIR}/.duplicacy-web"

ARG VERSION
RUN curl -fsSL "https://acrosync.com/duplicacy-web/duplicacy_web_linux_x64_${VERSION}" > "${APP_DIR}/duplicacy_web" && \
    chmod 755 "${APP_DIR}/duplicacy_web"

COPY root/ /
