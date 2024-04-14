FROM alpine:3.18

RUN apk add --no-cache nginx && \
	apk add vim openssl && \
	mkdir -p /var/www/html/ 

RUN apk update && apk add --no-cache curl tini


RUN  mkdir -p /etc/nginx/ssl


RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/self-signed.key -out /etc/nginx/ssl/self-signed.crt -subj "/C=KR/ST=Seoul/L=Gaepo/O=42Seoul/OU=Develop/CN=kichlee's"

COPY conf/default.conf /etc/nginx/http.d/default.conf

COPY tools/tools.sh /tmp/script.sh

RUN chmod 777 /tmp/script.sh

EXPOSE 443

ENTRYPOINT ["/sbin/tini", "--"]

CMD [ "/tmp/script.sh"]

