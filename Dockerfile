# Extend the latest ubuntu image
FROM alpine:latest

# Set a working directory
WORKDIR /app/

# COPY FILES
COPY app/ .

# Update / Upgrade apk
RUN apk update

# Install apk packages
RUN apk add \
    openjdk11-jre

# Clean up
RUN rm /var/cache/apk/*

# Set entrypoint to "sh"
ENTRYPOINT ["sh"]
