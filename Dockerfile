FROM tomcat:latest

MAINTAINER  YASH Sharma <yash99sh@gmail.com>

ENV role=app \
     env=dev\
    name=Yash_Sharma

EXPOSE 8080

RUN  apt-get update && apt-get install -y  netstat-nat  telnetd curl vim 
  
ADD sample.war  $CATALINA_HOME/webapps/

VOLUME [$CATALINA_HOME/webapps/] 

WORKDIR $CATALINA_HOME/webapps/

#CMD ["/usr/local/tomcat/bin", "sh", "catalina.sh",  "run"]
CMD $CATALINA_HOME/bin/catalina.sh run && tail -f /opt/tomcat/logs/catalina.out
