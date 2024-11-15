FROM nvcr.io/nvidia/nemo:dev

USER 0
RUN mkdir -p /opt/app-root/src /opt/app-root/bin \
    && chown -R 1001:0 /opt/app-root \
    && chmod -R 775 /opt/app-root

WORKDIR /opt/app-root/bin
COPY utils utils/
COPY start-notebook.sh ./

USER 1001
WORKDIR /opt/app-root/src
ENV HOME=/opt/app-root/src

EXPOSE 8888

ENTRYPOINT ["start-notebook.sh"]
