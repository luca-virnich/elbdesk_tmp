FROM --platform=linux/amd64 ubuntu:22.04

ARG FLUTTER_VERSION
ENV FLUTTER_VERSION=${FLUTTER_VERSION}

ARG SERVERPOD_VERSION
ENV SERVERPOD_VERSION=${SERVERPOD_VERSION}

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

#*******************************************************
#* Install and configure Flutter
#*******************************************************

# Install Flutter
RUN curl -LO https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz \
    && tar xf flutter_linux_${FLUTTER_VERSION}-stable.tar.xz \
    && mv flutter /usr/local/flutter \
    && rm flutter_linux_${FLUTTER_VERSION}-stable.tar.xz

# Add Flutter & Dart and Dart pub cache to PATH
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:/root/.pub-cache/bin:${PATH}"

# Mark Flutter directory as safe for Git
RUN git config --global --add safe.directory /usr/local/flutter

# Initialize Flutter and verify version
RUN flutter --version \
    && flutter doctor \
    && flutter config --no-analytics \
    && flutter precache --web

#*******************************************************
#* Install and configure Serverpod
#*******************************************************

# Install Serverpod CLI
RUN dart pub global activate serverpod_cli $SERVERPOD_VERSION