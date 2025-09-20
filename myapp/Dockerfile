# Use the official Jenkins agent image as a base image
FROM jenkins/agent:latest-alpine-jdk21

USER root
# Install Python and pip
RUN apk update && apk add --no-cache python3 py3-pip \
    && ln -sf python3 /usr/bin/python \
    && ln -sf pip3 /usr/bin/pip
