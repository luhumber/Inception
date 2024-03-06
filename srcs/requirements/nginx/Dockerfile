FROM		debian:bookworm

RUN apt-get update && apt-get install -y \
    nginx
RUN apt install openssl -y

COPY ./conf/nginx.conf  /etc/nginx/sites-available/default

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
     -keyout /etc/ssl/private/cert_key.key \
     -out /etc/ssl/certs/cert_key.crt \
     -subj "/C=FR/ST=RHONE/L=LYON/O=42 Lyon/OU=42/CN=luhumber.42.fr/UID=luhumber"

RUN chmod 777 -R /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]