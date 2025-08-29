ARG FLUTTER_VERSION

####################################################
# 1) BUILD STAGE (Ubuntu-based)
####################################################
FROM --platform=linux/amd64 ghcr.io/app-ahoi/flutter:${FLUTTER_VERSION} AS build-x86

ARG GITHUB_TOKEN
ARG GITHUB_USER
ARG RUN_MODE
ARG API_HOST
ARG WEB_APP_VERSION

# List files for debugging in GitHub Actions
RUN echo "Printing current directory:" && \
    pwd && \
    echo "\nListing root directory contents::" && \
    ls -la .


# Create app directory
WORKDIR /app

# List files for debugging in GitHub Actions
RUN echo "Printing current directory:" && \
    pwd && \
    echo "\nListing current directory contents::" && \
    ls -la .


# Configure Git
RUN if [ -n "$GITHUB_TOKEN" ] && [ -n "$GITHUB_USER" ]; then \
    echo "Configuring Git to use provided GitHub token..."; \
    git config --global url."https://$GITHUB_USER:$GITHUB_TOKEN@github.com/".insteadOf "https://github.com/"; \
    fi

# Copy project files
# COPY packages ./packages
# COPY servers/elbdesk_client ./servers/elbdesk_client
# COPY apps/elbdesk_app ./apps/elbdesk_app

COPY . .

RUN echo "Printing current directory:" && \
    pwd && \
    echo "\nListing current directory contents::" && \
    ls -la .

WORKDIR /app/apps/elbdesk_app

RUN echo "Printing current directory:" && \
    pwd && \
    echo "\nListing current directory contents::" && \
    ls -la .

RUN sed -i "s/flutter_bootstrap.js?version=[0-9]*/flutter_bootstrap.js?version=${WEB_APP_VERSION}/g" ./web/index.html

RUN flutter pub get

# Build Flutter web in release mode
RUN flutter build web --wasm --dart-define=RUN_MODE=${RUN_MODE} --dart-define=APP_VERSION=${WEB_APP_VERSION} --dart-define=API_HOST=${API_HOST} --release



####################################################
# 2) PRODUCTION STAGE (Alpine-based NGINX)
####################################################
FROM nginx:stable-alpine AS production

# Copy compiled Flutter web artifacts from build stage
COPY --from=build-x86 /app/apps/elbdesk_app/build/web /usr/share/nginx/html

COPY --from=build-x86 /app/apps/elbdesk_app/default.conf /etc/nginx/conf.d/default.conf
RUN sed -i 's/application\/javascript                           js;/application\/javascript                           js mjs;/' /etc/nginx/mime.types

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
