FROM ubuntu:14.04
MAINTAINER "Takayuki Miyauchi"

ENV DEBIAN_FRONTEND noninteractive

COPY bin/provision.sh provision.sh

RUN groupadd -g 1000 ubuntu && \
    useradd -g ubuntu -G sudo -m -s /bin/bash ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN WORK_DIR=$(pwd) && \
    su -l ubuntu -c bash -lc "/usr/bin/env bash ${WORK_DIR}/provision.sh"

USER ubuntu
ENV HOME /home/ubuntu
WORKDIR /home/ubuntu
ENV PATH $HOME/.phpenv/bin:$PATH
