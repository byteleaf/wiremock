# WireMock in a Docker-Container

## Build

docker build -t \\<domain\\>/wiremock .

## Run

docker run --rm -p 8088:8080 -p 8443:8443 \\<domain\\>/wiremock

## Run with docker-compose

```
version: "3.3"
services:
  wiremock:
    build:
      context: .
    ports:
      - "8088:8080"
      - "8443:8443"
    volumes:
      - ./__files:/home/wiremock/__files
      - ./mappings:/home/wiremock/mappings
```
