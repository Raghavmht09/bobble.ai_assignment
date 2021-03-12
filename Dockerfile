FROM tomcat:latest

MAINTAINER  Raghav Mehta <raghavmht9@gmail.com>

ENV role=app \
     env=dev\
    name=raghavmehta

EXPOSE 8080

RUN  apt-get update && apt-get install -y  netstat-nat  telnetd curl vim 
  
ADD sample.war  $CATALINA_HOME/webapps/

VOLUME [$CATALINA_HOME/webapps/] 

WORKDIR $CATALINA_HOME/webapps/

#CMD ["/usr/local/tomcat/bin", "sh", "catalina.sh",  "run"]
CMD $CATALINA_HOME/bin/catalina.sh run && tail -f /opt/tomcat/logs/catalina.out
