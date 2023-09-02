FROM node:18

WORKDIR /usr/src/app

COPY package*.json ./

ARG PAT_1=""

RUN npm add express
RUN npm ci --omit=dev

COPY . .

EXPOSE 9000
CMD [ "node", "express.js" ]
