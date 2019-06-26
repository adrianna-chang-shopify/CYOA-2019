# Learning Submission #2 - June 28th

### What have I learned?

##### Some Basic Terminology
_Docker Images_: Blueprints of our applications
_Docker Containers_: Created from images; running instances of images (running instances of our application)
_Docker Daemon_: Building, running and distributing containers
_Docker Client_: Run on our local machine and connect to the client 
_Docker Hub_: Registry of Docker images

##### Basic Docker Commands
One can interact with / create / modify Docker images and containers from within the console. Some important commands include:
- `docker images` to list any images
- `docker search` to search Docker Hub for a particular image
- `docker run <flags>` to run a given image
    - Example: `docker run -it ubuntu ./bin/bash`
    - Here: We search for the image if it cannot be found locally, and pull it from Docker Hub
    - `-i` captures the standard input of the container
    - `-t` associates a terminal with the container
    - `ubuntu` specifies the name of the image to run
    - `./bin/bash` specifies the command to run
    - So, essentially we get shell access into our ubuntu container using the above command
    - You can add the `-d` flag to start a container in the background (without opening a terminal for it)
- `docker ps` shows running containers
- `docker commit -a <author> <containerid> <imagename>:<tag>` creates a new image we can build off of
    - Example: `docker commit -a adriannac ccbb ubuntu-node:0.1`

##### Dockerfiles, Docker Image Layers, Docker Caching Mechanism
- A Dockerfile specifies the configuration for a Docker image
    - It is composed of commands (RUN, MAINTAINER, etc.) and arguments (ubuntu, apt-get, etc...)
    - A Docker image can be composed of layers of other images
    - The source code contains a couple of examples of Dockerfiles!
- When we run the `docker build` command, the Docker daemon will build an image using the contents specified in our Dockerfile.
- Use:
    - `docker build -t nodejs:0.1 .`
    - Here: We build a docker image from a Dockerfile we've written (provided in the src-code)
    - The `.` indicates to use the local directory as the context
    - `-t` specifies the tag we're giving the image
- Docker Caching Mechanism
    - As the Docker daemon moves from one command to another, it checks for images in cache
	* If it is present, but it has changed, it will rebuild the image
	* If it is not present, it will pull it
	* As soon as the daemon has to rebuild one layer, it will also rebuild all the subsequent layers
	* Consequently, it is important to optimize the order of commands in a Dockerfile!

##### Services, Networks and Volumes with Docker-Compose V2
- Only the Services section is manadatory in a Dockerfile
- **Services**
    - Can specify the image name, the context, the Dockerfile to start the build, and the command to start when the container builds
    - If the service has associated networks or volumes, those can be listed by name
- **Networks**
    - Specify on the services themselves which networks they're connected to
    - Define the networks themselves in the networks section
    -  Only services on the same network can communicate to each other
- **Volumes**
    - Specify on the services themselves which volumes they should be mounting
    - Define the volumes themselves in the volumes section
    - Volumes allow for data sharing between containers

### Resources Used
- [Udemy Containers 101 Course](https://www.udemy.com/containers-101/)
    - I went through the first portion of this free Udemy course, which was an introductory-level overview of Docker. It was an excellent first look at basic docker commands, Dockerfiles, and playing around with docker containers and images. The only issue I had was that some of the tools/packages/libraries used were deprecated, and I had to search for alternatives. Other than that, a highly recommended course IMO!
- [Docker Compose docs](https://docs.docker.com/compose/overview/)
    - These are just the basic docs for Docker Compose, and are a really nice reference point for the structure of a docker-compose.yml file.
- [Docker Reference Guide - Getting Started](https://docs.docker.com/get-started/)
    - The official Docker docs are obviously a great place to start learning about Docker. They offer some nice visuals to demonstrate how containers work, and also offer a cheat sheet for basic Docker commands.
