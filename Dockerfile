FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Install ttyd and bash (if bash isn’t already installed)
RUN apk update && apk upgrade && apk add bash && apk add nano

RUN apk add --no-cache ttyd bash

# Replace the default command with one that launches ttyd.
# Here, we run bash so that ttyd exposes an interactive shell.
CMD ["ttyd", "-t", "-p", "8080", "bash"]
