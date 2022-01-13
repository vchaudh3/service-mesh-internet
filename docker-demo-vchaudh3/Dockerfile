FROM node:4.6
WORKDIR /app
ADD . /app
RUN npm install
RUN apt update; apt install telnet mysql-client dnsutils -y
EXPOSE 3000
CMD npm start
