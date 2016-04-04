FROM ubuntu

RUN apt-get update
RUN apt-get -y install ca-certificates

EXPOSE 8080

COPY avialeta-api /opt
CMD /opt/avialeta-api