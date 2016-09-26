FROM ubuntu:16.04

COPY ./dist/grafana_3.1.1-1470047149_amd64.deb grafana_3.1.1-1470047149_amd64.deb
COPY ./resources/run.sh /run.sh

RUN apt-get update && \ 
    apt-get install -y adduser libfontconfig curl wget zip && \
    dpkg -i grafana_3.1.1-1470047149_amd64.deb && \
    mkdir /var/lib/grafana/dashboards && \
    chmod a+x run.sh

COPY ./resources/dashboards/mydashboard.json /dashboards/mydashboard.json
COPY ./resources/dashboards/analytics.json /dashboards/analytics.json

#COPY ./resources/dashboards/mydashboard.json /var/lib/grafana/dashboards/mydashboard.json

EXPOSE 3000

#ENTRYPOINT service grafana-server start && bash
ENTRYPOINT /run.sh

            
