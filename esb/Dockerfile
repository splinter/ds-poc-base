FROM java:8

COPY ./dist/wso2esb-5.0.0.zip wso2esb-5.0.0.zip
COPY ./resources/ESB_Artifacts_1.0.0.car ESB_Artifacts_1.0.0.car
COPY ./resources/run.sh run.sh

RUN chmod a+x run.sh && \
    unzip wso2esb-5.0.0.zip && \
    rm wso2esb-5.0.0.zip && \
    sed -i '/mediation.flow.statistics.enable=false/c\mediation.flow.statistics.enable=true' wso2esb-5.0.0/repository/conf/synapse.properties && \
    sed -i '/mediation.flow.statistics.tracer.collect.payloads=false/c\mediation.flow.statistics.tracer.collect.payloads=true' wso2esb-5.0.0/repository/conf/synapse.properties && \
    sed -i '/mediation.flow.statistics.tracer.collect.properties=false/c\mediation.flow.statistics.tracer.collect.properties=true' wso2esb-5.0.0/repository/conf/synapse.properties
 
CMD /run.sh

EXPOSE 9443
