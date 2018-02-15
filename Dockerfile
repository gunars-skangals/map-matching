FROM openjdk:8-jdk

ENV JETTY_PORT 8989
ENV JAVA_OPTS "-server -Xconcurrentio -Xmx1g -Xms1g -XX:+UseG1GC -XX:MetaspaceSize=100M"

RUN mkdir -p /data && \
    mkdir -p /graph-cache && \
    mkdir -p /graphhopper-map-match

COPY . /graphhopper-map-match/

WORKDIR /graphhopper-map-match

VOLUME [ "/data" ]
VOLUME [ "/graph-cache" ]

CMD [ "./map-matching.sh", "action=start-server" ]

EXPOSE 8989

#ENTRYPOINT [ "./map-matching.sh", "action=start-server" ]
ENTRYPOINT [ "./idle.sh" ]