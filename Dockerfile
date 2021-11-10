FROM bencdr/code-server-deploy-container:latest

USER root

RUN rm -rfv /home/coder/project/*
ADD ./tools/ /root/tools
COPY ./tools/config.yaml /root/config.yaml

RUN ls -la /home/coder
# RUN cat /home/coder/config.yaml

RUN sudo sh /root/tools/devtools.sh