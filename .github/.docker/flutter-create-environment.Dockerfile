FROM ubuntu:22.04

ARG FLUTTER_VERSION
ENV FLUTTER_VERSION=${FLUTTER_VERSION}

# Set a noninteractive environment
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies including CA certificates
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
    git \
    xz-utils \
    libglu-dev \
    && rm -rf /var/lib/apt/lists/*

# Ensure certificates are updated
RUN update-ca-certificates

# Install Flutter
RUN git clone --branch "${FLUTTER_VERSION}" https://github.com/flutter/flutter.git /usr/local/flutter

# Add Flutter & Dart to PATH
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Mark Flutter directory as safe for Git
RUN git config --global --add safe.directory /usr/local/flutter

# Initialize Flutter and verify version
RUN flutter --version \
    && flutter doctor \
    && flutter config --no-analytics \
    && flutter precache --web