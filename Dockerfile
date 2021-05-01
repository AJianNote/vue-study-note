FROM nginx

COPY build/default.conf /etc/nginx/conf.d/

RUN rm -rf /usr/share/nginx/html/*

COPY note/docs/.vuepress/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
