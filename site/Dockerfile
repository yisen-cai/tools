FROM nginx:latest

WORKDIR /usr/share/nginx/html

COPY ./build/ /usr/share/nginx/html/
COPY ./codelabs/ /usr/share/nginx/html/codelabs/
RUN ls -la /usr/share/nginx/html/*
COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]
