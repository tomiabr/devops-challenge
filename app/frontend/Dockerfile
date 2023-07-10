# Node 14 img, from Dockerhub
FROM node:16-alpine3.17 AS BUILD

RUN apk update && apk add git

# Set working directory


# Clone the code from my public repo
WORKDIR /app
COPY ~/devops-challenge/app/frontend .

# Install and build
RUN npm install
RUN npm run build

FROM node:16-alpine3.17
WORKDIR /home/node/app 
COPY --from=BUILD ./frontend ./
EXPOSE 3000

# Command to run the application
CMD [ "npm", "start" ]