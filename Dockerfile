# Dependencies and builds
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Deployment Phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# Start is the default nginx command so it is not necessary to write out the command in the Dockerfile
