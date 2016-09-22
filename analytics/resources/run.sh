local_ip=$(ip route get 1 | awk '{print $NF;exit}')
#  <!--HostName>www.wso2.org</HostName-->
#  <!--MgtHostName>mgt.wso2.org</MgtHostName-->

sed -i "s#<!--HostName>www.wso2.org</HostName-->#<HostName>$local_ip</HostName>#" wso2esb-analytics-5.0.0/repository/conf/carbon.xml
sed -i "s#<!--MgtHostName>mgt.wso2.org</MgtHostName-->#<MgtHostName>$local_ip</MgtHostName>#" wso2esb-analytics-5.0.0/repository/conf/carbon.xml

echo 'Running the ESB Analytics server'
sh wso2esb-analytics-5.0.0/bin/wso2server.sh
