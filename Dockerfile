###################
## Build go binary
FROM registry.access.redhat.com/ubi9/go-toolset:1.23 AS build

USER root
WORKDIR /build
COPY . .

RUN GOOS=linux go build -o hey .


########################
## Create runtime image
FROM registry.access.redhat.com/ubi9/ubi-minimal:9.5-1736404155

COPY --from=build /build/hey /usr/bin/hey
