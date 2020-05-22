# Extend the latest ubuntu image
FROM azul/zulu-openjdk-alpine:11-jre

# Get packages
RUN apk update
RUN apk add zsh

# Set a working directory
WORKDIR /app/

# COPY FILES
COPY app/ .

# CHMOD
RUN chmod +x ./boot.sh
RUN chmod -R 755 /app/

# Set entry point
ENTRYPOINT ["./boot.sh"]
