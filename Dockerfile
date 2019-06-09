FROM ubuntu:latest

MAINTAINER Shalabh Jaiswal

RUN mkdir -p /amps/

#install curl
RUN apt-get update && apt-get install -y curl

#install amps
COPY ./target/AMPS-5.3.0.5-Release-Linux.tar.gz /amps
RUN cd /amps/ && tar -oxvzf AMPS-5.3.0.5-Release-Linux.tar.gz && rm AMPS-5.3.0.5-Release-Linux.tar.gz

# install jdk 9
ARG JDK_VERSION=9.0.4
ARG SHA="39362fb9bfb341fcc802e55e8ea59f4664ca58fd821ce956d48e1aa4fb3d2dec"
ARG BASE_URL=https://download.java.net/java/GA/jdk9/9.0.4/binaries/

RUN mkdir -p /java /java/jdk9 \
  && curl -fsSL -o /tmp/jdk9.tar.gz ${BASE_URL}/openjdk-${JDK_VERSION}_linux-x64_bin.tar.gz \
  && echo "${SHA}  /tmp/jdk9.tar.gz" | sha256sum -c - \
  && tar -oxzf /tmp/jdk9.tar.gz -C /java/jdk9 --strip-components=1 \
  && rm -f /tmp/jdk9.tar.gz 

ENV JAVA_HOME /java/jdk9  

EXPOSE 8085 9007

COPY ./amps-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/amps-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/amps-entrypoint.sh"]

CMD ["/bin/sh"]