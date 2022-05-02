FROM ubuntu:20.04

RUN mkdir /app
WORKDIR /app/

COPY . /app

RUN sh scripts.sh