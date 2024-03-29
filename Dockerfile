FROM node:14-slim

ENV PORT 3000
ENV HOST 0.0.0.0
ENV DATASTORE cosmos
ENV BASE_PATH vipps-ots
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
COPY dbConfig.template.js dbConfig.js
RUN node_modules/typescript/bin/tsc

EXPOSE 3000

CMD [ "node", "./dist/index.js" ]
