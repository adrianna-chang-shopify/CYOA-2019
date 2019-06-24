FROM ubuntu:latest
MAINTAINER adrianna.chang@shopify.com

RUN apt-get update
RUN apt-get install -y nodejs npm
RUN apt-get clean

# Only copy package.json initially, since this is the only thing that npm install needs to know changed 
COPY ./package.json src/

RUN cd src && npm install

COPY . /src

# Tell daemon what is the working directory
WORKDIR /src

# Default command to be executed if container is run without a command
CMD ["npm", "start"]
