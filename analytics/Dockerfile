FROM java:8

COPY ./dist/wso2esb-analytics-5.0.0.zip wso2esb-analytics-5.0.0.zip
COPY ./resources/run.sh run.sh

RUN unzip wso2esb-analytics-5.0.0.zip && \
    rm wso2esb-analytics-5.0.0.zip && \
    chmod a+x run.sh  

CMD /run.sh

EXPOSE 7712
#EXPOSE 9444
