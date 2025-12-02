FROM nginx:alpine

# Копируем конфиг
COPY nginx.conf /etc/nginx/nginx.conf.template

# Копируем фронтенд
COPY html /usr/share/nginx/html

# Скрипт запуска: подставляет ENV переменную BACKEND_URL в конфиг nginx
# Если переменная не задана, можно использовать дефолт (но лучше задавать)
CMD ["/bin/sh", "-c", "envsubst 'TARGET_BACKEND' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && sed -i 's|TARGET_BACKEND|'\"$BACKEND_URL\"'|g' /etc/nginx/nginx.conf && nginx -g 'daemon off;'"]
