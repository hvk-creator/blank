# Use Debian 13 (Trixie) as the base image
FROM debian:trixie-slim

# Install ttyd and any required shell utilities
RUN apt-get update && apt-get install -y \
    ttyd \
    bash \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Choreo Requirement: Create a non-root user with a UID between 10000-20000
RUN adduser --disabled-password --gecos "" --uid 10500 choreouser
USER 10500
WORKDIR /home/choreouser

# Expose the application port
EXPOSE 8080

# Start ttyd on port 8080, launching bash
CMD ["ttyd", "-p", "8080", "bash"]
