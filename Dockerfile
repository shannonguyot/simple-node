# Use NodeJS base image
FROM node:13

# Setup ENV.
ARG PLURAL_NOUN_ARG="basset hounds"
RUN echo "PLURAL_NOUN_ARG is ${PLURAL_NOUN_ARG}"

ENV PLURAL_NOUN=$PLURAL_NOUN_ARG
RUN echo "PLURAL_NOUN is ${PLURAL_NOUN}"

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

# Bind the port that the image will run on
EXPOSE 8080

# Define the Docker image's behavior at runtime
CMD ["node", "server.js"]
