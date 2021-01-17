FROM ubuntu:20.04
LABEL maintainer "Nikolay Tsanov <hitechsmes@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 5.2.0

RUN apt update && apt install -y sudo apt-utils bash xterm
RUN apt install -y -q openjdk-8-jre \
				fonts-opensymbol \
				hyphen-fr \
				hyphen-en-us \
				fonts-dejavu \
				fonts-dejavu-core \
				fonts-dejavu-extra \
				fonts-freefont-ttf \
				fonts-liberation
ADD https://github.com/dbeaver/dbeaver/releases/download/${VERSION}/dbeaver-ce_${VERSION}_amd64.deb .
RUN dpkg -i dbeaver-ce_${VERSION}_amd64.deb

RUN useradd -ms /bin/bash me
USER me
WORKDIR /home/me
ENTRYPOINT [ "dbeaver" ]
