# Extend the latest ubuntu image
FROM azul/zulu-openjdk-alpine:11-jre

# Set a working directory
WORKDIR /app/

# Get bash
RUN apk update
RUN apk add zsh

# COPY FILES
COPY app/ .

# CHMOD
RUN chmod +x ./boot.sh
RUN chmod -R 755 /app/

# Set entry point
ENTRYPOINT ["./boot.sh"]
