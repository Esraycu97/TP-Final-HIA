FROM node:16.20.0 as angular

RUN mkdir -p /app

WORKDIR /app

COPY ./proyecto-final-frontend/package.json /app

RUN npm install

COPY ./proyecto-final-frontend/ /app

RUN npm run build --prod

FROM nginx:1.17.1-alpine

COPY --from=angular /app/dist/proyecto-final-frontend /usr/share/nginx/html
