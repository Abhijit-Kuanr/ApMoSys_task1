FROM ubuntu:24.04

# Prevent interactive prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

# Update packages and install curl and certificates
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Add NodeSource repository and install Node.js
RUN curl -fsSL https://nodesource.com | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*


# Verify installation
RUN node -v && npm -v
