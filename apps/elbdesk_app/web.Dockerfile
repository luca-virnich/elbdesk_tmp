####################################################
# PRODUCTION STAGE (Alpine-based NGINX)
####################################################
FROM nginx:stable-alpine AS production

WORKDIR /usr/share/nginx/html

COPY . .

RUN mv default.conf /etc/nginx/conf.d/default.conf
RUN sed -i 's/application\/javascript                           js;/application\/javascript                           js mjs;/' /etc/nginx/mime.types

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
