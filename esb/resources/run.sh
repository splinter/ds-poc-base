echo 'Running the ESB server'

sed -i 's#<property name="receiverURL">tcp://localhost:7612</property>#<property name="receiverURL">tcp://analytics:7612</property>#' wso2esb-5.0.0/repository/deployment/server/eventpublishers/MessageFlowConfigurationPublisher.xml 
sed -i 's#<property name="receiverURL">tcp://localhost:7612</property>#<property name="receiverURL">tcp://analytics:7612</property>#' wso2esb-5.0.0/repository/deployment/server/eventpublishers/MessageFlowStatisticsPublisher.xml

echo 'Finished updating reciever URLs'
sh wso2esb-5.0.0/bin/wso2server.sh
