FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf.template
COPY html /usr/share/nginx/html

CMD ["/bin/sh", "-c", "envsubst '$BACKEND_URL $MIRROR_AUTH_TOKEN $MIRROR_ID_NAME' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"]