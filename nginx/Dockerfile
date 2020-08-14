FROM nginx
RUN rm -f /etc/nginx/conf.d/*
#AWSサポート問合せ追加
#RUN mkdir -p /mnt/tmp/sockets
COPY ./nginx/nginx.conf /etc/nginx/conf.d/Exposer.conf
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
