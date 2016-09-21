FROM ubuntu:16.04

COPY ./dist/grafana_3.1.1-1470047149_amd64.deb grafana_3.1.1-1470047149_amd64.deb
RUN apt-get update && \ 
    apt-get install -y adduser libfontconfig && \
    dpkg -i grafana_3.1.1-1470047149_amd64.deb


#COPY ./run.sh /run.sh

#RUN chmod a+x run.sh

EXPOSE 3000

ENTRYPOINT service grafana-server start && bash

            
