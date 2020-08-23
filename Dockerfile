FROM python:2.7-slim-stretch

RUN  apt-get update \
	&& apt-get install -y \
	build-essential \
	libpq5 \
	libpq-dev \
	libmemcached-dev \
	zlib1g-dev \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /api

COPY ./requirements.txt /api

RUN pip install -U pip && pip install -r requirements.txt

COPY . /api
