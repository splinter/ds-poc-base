FROM java:8

COPY ./dist/wso2esb-5.0.0.zip wso2esb-5.0.0.zip
COPY ./resources/ESB_Artifacts_1.0.0.car ESB_Artifacts_1.0.0.car

RUN apt-get update && \ 
    apt-get install -y zip && \
    unzip wso2esb-5.0.0.zip && \
    rm wso2esb-5.0.0.zip && \
    sed '$ a > mediation.flow.statistics.enable=true' wso2esb-5.0.0/repository/conf/synapse.properties && \
    sed '$ a > mediation.flow.statistics.tracer.collect.payloads=true' wso2esb-5.0.0/repository/conf/synapse.properties && \
    sed '$ a > mediation.flow.statistics.tracer.collect.properties=true' wso2esb-5.0.0/repository/conf/synapse.properties
 
CMD sh wso2esb-5.0.0/bin/wso2server.sh
