FROM node:latest

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y python3 python3-pip python-is-python3 git nano

RUN yarn global add @medusajs/medusa-cli

RUN yarn add medusa-plugin-meilisearch

RUN yarn add medusa-file-s3

RUN yarn add medusa-plugin-sendgrid

RUN yarn --network-timeout 1600000

RUN yarn build --network-timeout 1600000

CMD medusa migrations run && yarn start
