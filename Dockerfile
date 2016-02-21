FROM ubuntu:14.04

RUN apt-get update && apt-get install -y curl

RUN curl https://install.meteor.com/ | sh

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y locales

RUN locale-gen en_US.UTF-8

RUN dpkg-reconfigure locales

ENV LC_ALL="en_US.UTF-8"

ENV LANG="en_US.UTF-8"

ENV LANGUAGE="en_US.UTF-8"

EXPOSE 3000

COPY . /opt/meteor-jobboard

WORKDIR /opt/meteor-jobboard

RUN meteor create .

RUN meteor add mquandalle:jade coffeescript http bootswatch:paper

CMD meteor
