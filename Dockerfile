FROM openjdk:7

ENV VERSION 5.2.0
RUN apt-get update
RUN apt-get install -y libswt-gtk-3-jni libswt-gtk-3-java
ADD https://github.com/dbeaver/dbeaver/releases/download/${VERSION}/dbeaver-ce_${VERSION}_amd64.deb .
RUN dpkg -i dbeaver-ce_${VERSION}_amd64.deb

RUN echo "Starting dbeaver!!!!!" >> temp.log
CMD dbeaver & tail -f temp.log
