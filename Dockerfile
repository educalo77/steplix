FROM node:14

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app/backend

COPY backend/package*.json ./

RUN apt-get update && apt-get install -y postgresql-client

RUN npm install

COPY . .

EXPOSE 5000

CMD ["npm", "start"]