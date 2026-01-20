FROM alpine:3.22.0

RUN apk update && apk add --no-cache nginx openssl bash

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -days 365 -newkey rsa:2048 -nodes \
    -out /etc/nginx/ssl/nginx.crt \
    -keyout /etc/nginx/ssl/nginx.key \
    -subj "/C=FR/ST=PARIS/L=PARIS/O=42 School/OU=${DOMAIN_NAME}CN=${DOMAIN_NAME}"

COPY conf/my_default.conf /etc/nginx/http.d/default.conf

EXPOSE 443/tcp

CMD ["nginx", "-g", "daemon off;"]
