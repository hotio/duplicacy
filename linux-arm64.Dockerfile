FROM cr.hotio.dev/hotio/base@sha256:32f7802fe9903727645618677d0109a2da34a6d2efbc494f3afae50fdb7b2dd2

EXPOSE 3875

VOLUME ["/cache","/logs"]

RUN mkdir "/var/lib/dbus" && ln -s "${CONFIG_DIR}/machine-id" "/var/lib/dbus/machine-id" && \
    ln -s "${CONFIG_DIR}/" "${APP_DIR}/.duplicacy-web"

ARG VERSION
RUN curl -fsSL "https://acrosync.com/duplicacy-web/duplicacy_web_linux_arm64_${VERSION}" > "${APP_DIR}/duplicacy_web" && \
    chmod 755 "${APP_DIR}/duplicacy_web"

COPY root/ /
RUN chmod -R +x /etc/cont-init.d/ /etc/services.d/
