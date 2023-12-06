FROM 331139610421.dkr.ecr.us-west-2.amazonaws.com/prebid-server-java:openjdk17-base AS build

COPY . .

RUN mvn clean package -U -Dmaven.test.skip=true


FROM amazoncorretto:17

WORKDIR /app/prebid-server

RUN yum install -y shadow-utils && \
        yum clean all && \
        useradd prebid && \
        mkdir /logs && \
        chown -R prebid /app/prebid-server /logs

USER prebid

COPY --from=build /opt/conf/. ./conf/
COPY --from=build /opt/target/prebid-server.jar ./

ENTRYPOINT [ "/app/prebid-server/conf/run.sh" ]
