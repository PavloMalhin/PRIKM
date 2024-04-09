FROM nginx:latest
RUN rm -rf /usr/share/nginx/html/index.html
COPY ./mysite/. /usr/share/nginx/html/
#text 