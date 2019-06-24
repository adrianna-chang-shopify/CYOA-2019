FROM ubuntu:latest
MAINTAINER adrianna.chang@shopify.com

# Install nodejs
RUN apt-get update
RUN apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install --yes nodejs
RUN apt-get clean

# Create folder in image for src code
RUN mkdir src/
WORKDIR src/

# Command to run on container start
CMD ["npm, "start"]

# Add triggers
ONBUILD COPY ./package.json ./
ONBUILD RUN npm install
ONBUILD COPY . . 

