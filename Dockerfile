FROM bencdr/code-server-deploy-container:latest

USER root

ADD . /home/coder/tools
COPY ./tools/config.yaml /home/coder/config.yaml

RUN sudo sh /home/coder/tools/tools/devtools.sh