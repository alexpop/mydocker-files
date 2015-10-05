FROM centos:latest
MAINTAINER Alex Pop <alex@youwishspammer.com>

VOLUME ["/logs"]

RUN mkdir -p /logs && \
    yum install -y tomcat && \
    echo 'NAME="tomcat"' >> /etc/tomcat/tomcat.conf

# Script to deploy code using ENV variables and start Tomcat
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 8080

CMD ["/run.sh"]
