FROM ghcr.io/hotio/base@sha256:f61c51dd5ce6b96beb40e0fcd12f422260a724b69c60153e925969830cbe3ba0

EXPOSE 3875

VOLUME ["/cache","/logs"]

RUN mkdir "/var/lib/dbus" && ln -s "${CONFIG_DIR}/machine-id" "/var/lib/dbus/machine-id" && \
    ln -s "${CONFIG_DIR}/" "${APP_DIR}/.duplicacy-web"

ARG VERSION
RUN curl -fsSL "https://acrosync.com/duplicacy-web/duplicacy_web_linux_x64_${VERSION}" > "${APP_DIR}/duplicacy_web" && \
    chmod 755 "${APP_DIR}/duplicacy_web"

COPY root/ /
