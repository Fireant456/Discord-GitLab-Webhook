FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./
COPY *.js ./
COPY require/ ./

USER node

RUN npm install
RUN npm install pm2@latest -g

COPY --chown=node:node . .

CMD [ "pm2", "start", "server.js", "-name", "dgw-bot" ]
