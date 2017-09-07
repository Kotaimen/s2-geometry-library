FROM    ubuntu:xenial

MAINTAINER  KOTAIMEN <kotaimen.c@gmail.com>

WORKDIR /usr/src/app
ADD     .   /usr/src/app

RUN     set -ex \
        && apt-get update \
        && apt-get install -yq \
            build-essential \
            python-dev python-pip libssl-dev swig cmake \
        && pip install geojson


RUN     set -ex \
        && cd geometry \
        && cmake . \
        && make install \
        && cd python \
        && cmake . \
        && make install \
        && ldconfig

ENTRYPOINT python
