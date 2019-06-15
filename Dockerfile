FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

EXPOSE 3000

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

COPY . .

COPY --chown=node:node . .

HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost:1337/ || exit 1

USER node

CMD [ "node", "start" ]
