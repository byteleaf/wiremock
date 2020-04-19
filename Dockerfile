FROM adoptopenjdk/openjdk11

MAINTAINER Stefan Sauterleute byteleaf GmbH <info@byteleaf.de>

ENV WIREMOCK_VERSION 2.26.3

# install wiremock
RUN mkdir -p /home/wiremock/ \
    && curl https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/$WIREMOCK_VERSION/wiremock-standalone-$WIREMOCK_VERSION.jar \
    --output /home/wiremock/wiremock-standalone.jar && groupadd -r wiremock && useradd --no-log-init -r -g wiremock wiremock

WORKDIR /home/wiremock

USER wiremock

EXPOSE 8080 8443

ENTRYPOINT ["java", "-jar", "wiremock-standalone.jar"]
