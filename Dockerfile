# Extend the latest ubuntu image
FROM azul/zulu-openjdk-alpine:latest

# Set a working directory
WORKDIR /app/

# COPY FILES
COPY app/ .

# CHMOD
RUN chmod +x ./boot.sh
RUN chmod -R 777 /app/

# Set entrypoint to "sh"
ENTRYPOINT ["sh"]
