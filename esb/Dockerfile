FROM java:8

COPY ./dist/wso2esb-5.0.0.zip wso2esb-5.0.0.zip
COPY ./resources/ESB_Artifacts_1.0.0.car ESB_Artifacts_1.0.0.car
COPY ./resources/run.sh run.sh
COPY ./resources/run-axis2.sh run-axis2.sh

RUN apt-get update && \
    apt-get install -y ant && \
    rm -rf /var/lib/apt/lists/* && \
    chmod a+x run.sh && \
    chmod a+x run-axis2.sh && \
    unzip wso2esb-5.0.0.zip && \
    rm wso2esb-5.0.0.zip && \
    sed -i '/mediation.flow.statistics.enable=false/c\mediation.flow.statistics.enable=true' wso2esb-5.0.0/repository/conf/synapse.properties && \
    sed -i '/mediation.flow.statistics.tracer.collect.payloads=false/c\mediation.flow.statistics.tracer.collect.payloads=true' wso2esb-5.0.0/repository/conf/synapse.properties && \
    sed -i '/mediation.flow.statistics.tracer.collect.properties=false/c\mediation.flow.statistics.tracer.collect.properties=true' wso2esb-5.0.0/repository/conf/synapse.properties && \
    cp ESB_Artifacts_1.0.0.car wso2esb-5.0.0/repository/deployment/server/carbonapps  
 
#CMD /run.sh
#CMD /run-axis2.sh
CMD /run.sh

#ENTRYPOINT ["/run.sh","/run-axis2.sh"]

EXPOSE 9443

