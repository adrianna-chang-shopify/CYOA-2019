# Learning Submission #1 - June 14th

### What have I learned?
For this first portion of learning, I dedicated my time entirely to learning more about Kubernetes. Here are some of the key takeaways:

**Objects in Kubernetes**
- A node is a worker machine in Kubernetes, either a physical machine or a virtual machine
- A node can have multiple pods. A pod typically has one containerized app, but could have multiple if they need to share resources
    * Pods managed in Kubernetes using a /Controller/ (it’s very rare that pods are managed directly)
    * A Controller can create and manage multiple Pods for you, handling replication and rollout and providing self-healing capabilities at cluster scope.
- A Kubelet is a process responsible for communication between Kubernetes master and a node. Each node runs a Kubelet process
- Every node runs a container runtime (like Docker, rkt) responsible for pulling the container image from a registry, unpacking the container, and running the application.
- Kubernetes supports multiple virtual clusters backed by the same physical cluster. These virtual clusters are called namespaces.
    *  Namespaces are a way to divide cluster resources between multiple users (via a *resource quota*)
- Services allow your app to receive traffic. They are the abstraction that allow pods to die and replicate in Kubernetes without impacting your application
	* Services match a set of Pods using labels and selectors. Labels are key / value pairs attached to objects
	* Services have an integrated load-balancer, which distributes traffic to all pods of an exposed deployment. Services monitor the pods, and only direct traffic to available ones
* Scaling is accomplished by changing the number of replicas in a Deployment
* A Deployment controller is a Kubernetes object that provides declarative updates for Pods and ReplicaSets.

**Launching a Web App using Kubernetes and Docker**
* Kubernetes runs code inside a container, not directly
* Container contains: 1) compiled version of source code and 2) any necessary runtime dependencies
* Dockerfile: Packages a web app as a container
	* This Dockerfile starts with the base image (Alpine:3.5), installs Python dependencies for the webapp, exposes a port for the webapp on the container, and then specifies the command to run when the container starts
	* The container can be built manually
	* This builds a Docker image
	* Base Image = OS
	* Runtime env = Python
	* App itself = Hello World
* Run the container: `docker run -d -p 80:8080 hello-webapp:v1`
* `curl host01` to ensure it’s running
* **Kubernetes Manifests**
	* Manifest stored in a `deployment.yaml`
	* Points to a Docker image
	* Sets CPU / Memory Limits and Ports exposed
* **Container Registry**
	* Kubernetes needs a copy of the image in order to be able to run it
	* CR = central service that hosts images
	* We set registry as an ENV variable: `export REGISTRY=2886795289-5000-cykoria03.environments.katacoda.com`
	* We create a tag on the Docker image that contains our registry name`docker tag hello-webapp:v1 $REGISTRY/hello-webapp:v1`
	* Then, we can push our image we created to the registry `docker push $REGISTRY/hello-webapp:v1`
* Now, we need to update our `deployment.yaml` to point to the image we’ve created: `$REGISTRY/hello-webapp:v1` (in containers/image)
* Apply manifest: `kubectl apply -f deployment.yaml`
* Then `kubectl get services` to see our app

```
Four pieces required for deployment:
1) created a container
2) created the Kubernetes manifest
3) pushed the container to a registry
4) told Kubernetes all about these pieces with an updated manifest.
```

### Resources Used
- [Kubernetes Documentation - Basics](https://kubernetes.io/docs/concepts/)
    - The K8s docs are really nice. They give a good overview of the architecture of Kubernetes, and highlight the key objects that are required to get an application up and running. They offer a lot of detailed diagrams that helped me figure out how things fit together.
- [Kubernetes Tutorials](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
    - The K8s tutorials provided on the Kubernetes site are pretty simple, and quite beginner-friendly. There was a bit of terminology I was unfamiliar with, but on the whole they offered a good, practical introduction to using K8s objects.
- [Katacoda Kubernetes Tutorials](https://www.katacoda.com/courses/kubernetes)
    - The Katacoda tutorials were where I spent the bulk of my time learning. Katacoda offers interactive browser-based scenarios, ranging in levels of difficulty. I learned about a lot of different topics and scenarios that K8s can handle. Some of the tutorials were a bit too challenging for me to really understand, but on the whole I found this to be an excellent resource as someone with fairly little knowledge about DevOps.
