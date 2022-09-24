FROM nginx:mainline-alpine

RUN chmod -R a+w /var/cache/nginx \
    && touch /var/run/nginx.pid \
    && chmod a+w /var/run/nginx.pid \
    && rm /etc/nginx/conf.d/* 

COPY sciencepub.conf /etc/nginx/conf.d/
COPY . /usr/share/nginx/html/
RUN chmod -R a+r /usr/share/nginx/html/
EXPOSE 8080
USER nginx