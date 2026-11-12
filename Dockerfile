FROM ubuntu:24.04

# Prevent interactive prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

# Update packages and install curl and certificates
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Add NodeSource repository and install Node.js (split URL to prevent auto-shortening)
RUN SUBDOMAIN="deb" && \
    DOMAIN="nodesource.com" && \
    SCRIPT="setup_22.x" && \
    curl -fsSL "https://${SUBDOMAIN}.${DOMAIN}/${SCRIPT}" | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*



# Verify installation
RUN node -v && npm -v
