FROM ghcr.io/hotio/base@sha256:d3f7d0d2e9cd937bc1499d9f79fa33267b6520abcd341d28e2516268eb08b955

EXPOSE 3875

VOLUME ["/cache","/logs"]

RUN mkdir "/var/lib/dbus" && ln -s "${CONFIG_DIR}/machine-id" "/var/lib/dbus/machine-id" && \
    ln -s "${CONFIG_DIR}/" "${APP_DIR}/.duplicacy-web"

ARG VERSION
RUN curl -fsSL "https://acrosync.com/duplicacy-web/duplicacy_web_linux_armv7_${VERSION}" > "${APP_DIR}/duplicacy_web" && \
    chmod 755 "${APP_DIR}/duplicacy_web"

COPY root/ /
