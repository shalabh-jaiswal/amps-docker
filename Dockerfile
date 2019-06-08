FROM ubuntu:latest

MAINTAINER Shalabh Jaiswal

RUN mkdir -p /amps/

COPY ./target/AMPS-5.3.0.5-Release-Linux.tar.gz /amps

RUN cd /amps/ && tar -oxvzf AMPS-5.3.0.5-Release-Linux.tar.gz && rm AMPS-5.3.0.5-Release-Linux.tar.gz

#CMD [/amps/AMPS-5.3.0.5-Release-Linux/bin/ampServer --sample-config > config.xml]
#CMD [/amps/AMPS-5.3.0.5-Release-Linux/bin/ampServer config.xml]

CMD ["/bin/sh"]