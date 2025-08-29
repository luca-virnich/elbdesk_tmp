# If you update the dart version, make sure the image is
# compatible with the busybox image.
FROM dart:3.7.0 AS build

# Accept the GITHUB_PAT and GITHUB_USER as an argument
ARG GITHUB_TOKEN
ARG GITHUB_USER
ARG SERVERPOD_RUN_MODE
# ARG SERVERPOD_CONFIG_NAME

# List files for debugging in GitHub Actions
RUN echo "Printing current directory:" && \
    pwd && \
    echo "\nListing current directory contents::" && \
    ls -la .

WORKDIR /app

# List files for debugging in GitHub Actions
RUN echo "Printing current directory:" && \
    pwd && \
    echo "\nListing current directory contents::" && \
    ls -la .


COPY . .

# List files for debugging in GitHub Actions
RUN echo "Printing current directory:" && \
    pwd && \
    echo "\nListing current directory contents::" && \
    ls -la .


# Conditionally configure Git to use the provided GitHub token
# RUN if [ -n "$GITHUB_PAT" ] && [ -n "$GITHUB_USER" ]; then \
#     echo "Configuring Git to use provided GitHub token..."; \
#     # Add GitHub's public SSH key to known_hosts for security
#     mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts; \
#     git config --global credential.helper 'store'; \
#     echo "url=https://github.com/.insteadOf git://github.com/" >> ~/.gitconfig; \
#     echo "https://$GITHUB_USER:$GITHUB_PAT@github.com" > ~/.git-credentials; \
#     else \
#     echo "No GitHub token provided. Skipping Git configuration..."; \
#     fi


# Configure Git
RUN if [ -n "$GITHUB_TOKEN" ] && [ -n "$GITHUB_USER" ]; then \
    echo "Configuring Git to use provided GitHub token..."; \
    git config --global url."https://$GITHUB_USER:$GITHUB_TOKEN@github.com/".insteadOf "https://github.com/"; \
    fi

# Use sed to comment out lines containing packages/ or apps/ under workspace:
# RUN sed -i.bak '/workspace:/!b;:a;n;/^[[:space:]]*-/!b;/\(packages\|apps\)\//{s/^/#/};ba' pubspec.yaml
RUN dart run .scripts/modify_workspace.dart
# RUN dart run .scripts/comment_dependency_overrides.dart

RUN dart pub get
RUN dart compile exe servers/elbdesk_server/bin/main.dart -o servers/elbdesk_server/bin/main

# Create a directory for runtime dependencies
RUN mkdir /app/runtime

# If you update the busybox version, make sure the image is
# compatible with the dart image.
# FROM busybox:1.36.1-glibc

FROM alpine:latest


# Correcting the source directory for runtime dependencies
COPY --from=build /runtime/ /
COPY --from=build /app/servers/elbdesk_server/bin/main /app/bin/main
COPY --from=build /app/servers/elbdesk_server/config/* config/
COPY --from=build /app/servers/elbdesk_server/web/ web/
COPY --from=build /app/servers/elbdesk_server/migrations/ migrations/

# Conditionally copy the config file based on SERVERPOD_RUN_MODE and SERVERPOD_CONFIG_NAME
ARG SERVERPOD_RUN_MODE
# ARG SERVERPOD_CONFIG_NAME
# RUN echo "SERVERPOD_RUN_MODE: $SERVERPOD_RUN_MODE" && \
#     echo "SERVERPOD_CONFIG_NAME: $SERVERPOD_CONFIG_NAME" && \
#     if [ "$SERVERPOD_RUN_MODE" != "$SERVERPOD_CONFIG_NAME" ]; then \
#     cp config/${SERVERPOD_CONFIG_NAME}.yaml config/${SERVERPOD_RUN_MODE}.yaml; \
#     fi

# # Rename the root key in passwords.yaml using embedded script
# RUN if [ "$SERVERPOD_RUN_MODE" != "$SERVERPOD_CONFIG_NAME" ]; then \
#     PASSWORDS_FILE="config/passwords.yaml"; \
#     TEMP_FILE=$(mktemp); \
#     sed -e "s/^$SERVERPOD_RUN_MODE:/${SERVERPOD_RUN_MODE}_bak:/" "$PASSWORDS_FILE" | sed -e "s/^$SERVERPOD_CONFIG_NAME:/$SERVERPOD_RUN_MODE:/" > "$TEMP_FILE"; \
#     mv "$TEMP_FILE" "$PASSWORDS_FILE"; \
#     fi

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ["/app/bin/main"]
CMD ["--mode", "$SERVERPOD_RUN_MODE", "--server-id", "default", "--logging", "verbose", "--role", "monolith"]
