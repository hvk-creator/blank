# Use Ubuntu as image
FROM ubuntu:26.04

# Install ttyd and any required shell utilities
RUN apt-get update && apt-get install -y \
    ttyd \
    bash \
    curl \
    redis-tools

# Choreo Requirement: Create a non-root user with a UID between 10000-20000
USER root
WORKDIR /root

# Expose the application port
EXPOSE 7681

# Start ttyd on port 8080, launching bash
CMD ["ttyd", "-c", "0000abcd:jfkieisjdisjfksj" "-W", "sh", "-c", "redis-cli -u redis://orkestr-addon-blank-rd:6379/0"]

