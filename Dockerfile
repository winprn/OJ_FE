FROM alpine:latest

RUN apk add --update --no-cache \
    vim git nginx python3 build-base nodejs-current npm openssh

# VOLUME [ "/OJ_FE", "/var/log/nginx/", "/data/avatar"]
# EXPOSE 80

RUN chmod -R 777 /home

COPY / /home/OJ_FE

CMD ["/bin/sh", "/home/OJ_FE/deploy/run.sh"]
