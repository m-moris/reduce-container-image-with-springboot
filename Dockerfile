FROM debian:buster-slim
ENV LANG en_US.UTF-8
ENV JAVA_HOME /usr/lib/jvm/msopenjdk-17-amd64
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=mcr.microsoft.com/openjdk/jdk:17-ubuntu $JAVA_HOME $JAVA_HOME

# Continue with your application deployment
EXPOSE  8080
RUN mkdir /opt/app
COPY target/demo-0.0.1-SNAPSHOT.jar /opt/app/japp.jar
CMD ["java", "-jar", "/opt/app/japp.jar"]