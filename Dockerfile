FROM node:16-alpine as builder
RUN mkdir /app
RUN chown -R node /app
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html