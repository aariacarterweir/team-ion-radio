# Extend the latest ubuntu image
FROM azul/zulu-openjdk-alpine:latest

# Set a working directory
WORKDIR /app/

# COPY FILES
COPY app/ .

# Set entrypoint to "sh"
ENTRYPOINT ["sh"]
