FROM debian:latest as builder

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/Kev1nLopes/BlogJava.git /tmp/BlogJava

RUN chown -R 1000:1000 /tmp/BlogJava

FROM jboss/wildfly:19.0.0.Final

ENV JBOSS_HOME /opt/jboss/wildfly

USER root
RUN chown -R jboss:jboss $JBOSS_HOME/standalone/deployments/
USER jboss

COPY --from=builder --chown=1000:1000 /tmp/BlogJava/ $JBOSS_HOME/standalone/deployments/

EXPOSE 8080

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]