FROM node:argon

RUN mkdir -p usr/src/app

COPY package.json npm-shrinkwrap.json usr/src/app/
COPY node_shrinkwrap usr/src/app/node_shrinkwrap

WORKDIR usr/src/app
RUN npm install

WORKDIR /
COPY . usr/src/app/

WORKDIR usr/src/app
RUN npm run compile

EXPOSE 3000

CMD ["npm", "start"]
