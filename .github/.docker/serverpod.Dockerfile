############################################################
# Build Stage 
############################################################
ARG DART_VERSION

FROM dart:${DART_VERSION} AS build

ARG SERVER_PATH

WORKDIR /app/
COPY . .

WORKDIR /app/${SERVER_PATH}

RUN --mount=type=secret,id=GITHUB_TOKEN \
    git config --global url."https://x-access-token:$(cat /run/secrets/GITHUB_TOKEN)@github.com/".insteadOf "https://github.com/" \
&& dart pub get

RUN mkdir -p /out
RUN dart compile exe bin/main.dart -o /out/main


############################################################
# Runtime Stage 
############################################################
FROM debian:bookworm-slim

ARG SERVER_PATH

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the binary and assets
COPY --from=build /out/main                        /app/bin/main
COPY --from=build /app/${SERVER_PATH}/config/      /app/config/
COPY --from=build /app/${SERVER_PATH}/web/         /app/web/
COPY --from=build /app/${SERVER_PATH}/migrations/  /app/migrations/

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

# Exec-Form für sauberes Signal-Handling
ENTRYPOINT ["/app/bin/main"]