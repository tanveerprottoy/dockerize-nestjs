FROM node:lts-alpine as dev

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm i

COPY . .

RUN npm run build

FROM node:lts-alpine as prod

# static
ENV BUILD prod

# dynamic
# ARG BUILD
# ENV BUILD $BUILD

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm i --only=prod

COPY . .

COPY --from=dev /usr/src/app/dist ./dist

EXPOSE 3000

CMD ["node", "dist/main"]