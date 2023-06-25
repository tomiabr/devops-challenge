# Node 14 img, from Dockerhub
FROM node:16-alpine3.17

RUN apk update && apk add git

# Set working directory
WORKDIR /frontend

# Clone the code from my public repo
RUN git clone https://github.com/tomiabr/devops-challenge-my.git
COPY . .

# Install a build
RUN npm install
RUN npm run build

# Define the command to run the application
CMD [ "npm", "start" ]