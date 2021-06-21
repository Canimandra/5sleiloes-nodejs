FROM node:14

RUN mkdir /src
# hadolint ignore=DL3016
RUN npm install npm -g
# hadolint ignore=DL3016
RUN npm install pm2 -g

WORKDIR /src
COPY package.json .
COPY package-lock.json .

RUN npm install

COPY pm2.yml .

EXPOSE 3000

CMD ["npm", "start"]