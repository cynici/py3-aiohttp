FROM alpine:edge
#FROM python:3.6
LABEL maintainer "Cheewai Lai <clai@csir.co.za>"

ARG GOSU_VERSION=1.10
ARG DOCKERIZE_VERSION=v0.5.0

# NOTE: pip3 is installed with python3 in alpine repos.

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >>/etc/apk/repositories \
 && apk update \
 && apk add --upgrade apk-tools \
 && apk add curl python3 py3-yaml py3-jinja2 py3-aiohttp-jinja2@testing py3-numpy py3-psycopg2 py3-requests geos@testing geos-dev@testing py3-setuptools \
 && ln -s /usr/bin/python3 /usr/bin/python \
 && apk add --virtual build-dependencies python3-dev build-base \
 && pip3 install --upgrade pip \
 && pip3 install asyncpg \
 && pip3 install async-timeout \
 && pip3 install chardet \
 && pip3 install dateutils \
 && pip3 install multidict \
 && pip3 install yarl \
 && pip3 install aiohttp \
 && pip3 install aiopg \
 && pip3 install aiodns \
 && pip3 install aioamqp \
 && pip3 install aiomysql \
 && pip3 install aiofiles \
 && pip3 install pytest \
 && pip3 install rethinkdb \
 && pip3 install raven raven_aiohttp --upgrade \
 && pip3 install Shapely \
 && apk del build-dependencies \
 && rm -rf /var/cache/apk/* \
 && curl -k -fsSL https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar xfz - -C /usr/bin \
 && curl -o /usr/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64" \
 && chmod +x /usr/bin/gosu

COPY docker-entrypoint.sh /
WORKDIR /home/runuser
ENTRYPOINT ["/docker-entrypoint.sh"]
