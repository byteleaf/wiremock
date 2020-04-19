FROM adoptopenjdk/openjdk11

MAINTAINER Stefan Sauterleute byteleaf GmbH <info@byteleaf.de>

ENV WIREMOCK_VERSION 2.26.3

# get wiremock standalone jar
RUN mkdir -p /home/wiremock/ \
    && curl https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/$WIREMOCK_VERSION/wiremock-standalone-$WIREMOCK_VERSION.jar \
    --output /home/wiremock/wiremock-standalone.jar

WORKDIR /home/wiremock

EXPOSE 8080 8443

ENTRYPOINT ["java", "-jar", "wiremock-standalone.jar"]
