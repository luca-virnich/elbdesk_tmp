# ========= build stage =========
ARG REGISTRY
ARG GHCR_ORG                       
ARG FLUTTER_VERSION

FROM --platform=linux/amd64 ${REGISTRY}/${GHCR_ORG}/flutter:${FLUTTER_VERSION} AS build

ARG APP_VERSION
ARG APP_PATH
ARG RUN_MODE

WORKDIR /fullrepo
COPY . .
WORKDIR /fullrepo/${APP_PATH}

RUN --mount=type=secret,id=GITHUB_TOKEN \
    git config --global url."https://x-access-token:$(cat /run/secrets/GITHUB_TOKEN)@github.com/".insteadOf "https://github.com/" \
 && flutter pub get
 
RUN flutter build web --release \
    --dart-define=APP_VERSION=$APP_VERSION \
    --dart-define=RUN_MODE=$RUN_MODE

# ========= runtime stage =======
FROM nginx:alpine
ARG APP_PATH
COPY --from=build /fullrepo/${APP_PATH}/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]