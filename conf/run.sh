#!/bin/sh

exec java \
  -Dvertx.cacheDirBase=/app/prebid-server/data/.vertx \
  -Dspring.config.additional-location=/app/prebid-server/,/app/prebid-server/conf/ \
  -Dlogging.config=/app/prebid-server/conf/logback-spring.xml \
  ${JAVA_OPTS} \
  -jar /app/prebid-server/prebid-server.jar \
  --spring.config.additional-location=/app/prebid-server/conf/prebid-config.yaml
