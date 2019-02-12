FROM ubuntu:18.04

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install tree