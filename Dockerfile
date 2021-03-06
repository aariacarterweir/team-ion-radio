# Extend the latest ubuntu image
FROM openjdk:latest

# Set a working directory
WORKDIR /app/

# COPY FILES
COPY app/ .

# CHMOD
RUN chmod +x ./boot.sh
RUN chmod -R 755 /app/

# Set entry point
ENTRYPOINT ["./boot.sh"]
