FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
CMD ["sh", "-c", "printf 'server { listen %s; root /usr/share/nginx/html; index index.html; location / { try_files $uri $uri/ /index.html; } }\\n' \"${PORT:-8080}\" > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]
