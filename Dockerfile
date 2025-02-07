FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN apk update && apk upgrade && apk add bash && apk add nano

RUN apk add --no-cache ttyd bash

EXPOSE 8080

CMD ["ttyd", "-t", "-p", "8080", "bash"]