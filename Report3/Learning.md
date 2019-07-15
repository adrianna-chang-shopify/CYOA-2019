# Learning Submission #3 - July 19th

### What have I learned?

**Docker Multi-Stage**
Typically, a _Docker Build_ approach is taken when containerizing an application. We use a Dockerfile
to define a series of build commands. Each *docker build* command generates ONE image layer, and each
complete *docker build* execution generates ONE Docker image.

However, there exists a problem with the Docker build approach. Sometimes, we might want to produce a
different, more optimized image compared to what is defined in the Dockerfile. For example, we might have
one image that contains various types of artifacts (compilers, debuggers, development tools, etc...)
This image will be huge; we might want a simpler production image that does not contain any development tools,
or any of the artifacts that aren't strictly required to run the application.

Other approaches exist:
- Docker Build Pattern (multiple files)
  * We create 2 Dockerfiles
  * The first one is for the build tools, second one is for our runtime image (only what is needed to run the application)
  * However, this approach has drawbacks:
    * 2+ Dockerfiles that need to be managed
    * Orchestration needed to pass artifacts around - this also adds complexity in terms of reproducing the flow on a local machine

The Better Approach: Docker Multi-Stage Build
* Docker multi-stage build
  * Build smaller images with multi-stage builds
  * First stage: complete build env
  * Second stage: minimal runtime env
  * One Dockerfile, one build!
    * Works locally and with CI
  * Can create multiple stages!
    * Stage for compilers, linters, testing, release, etc…

  For an example of a Docker Multi-Stage Build file, see the `src-code` directory.


**Linux Shell Scripting**

Basics of Running a Shell Script:
* Shell script = text file that contains series of commands
	* Same as typing commands directly into terminal
	* Commands in a script can be written in the CLI
* Create script `intro.sh`
* Need to give execute permissions: `chmod +x intro.sh`
	* Change mode to execute permissions
	* `ls -l` shows permissions for files
	* `-rwxr-xr-x`
		* Initial dash - indicates that it’s a file instead of a directory
		* First group: user permissions (adriannachang)
		* Second group: group permissions (staff)
		* Third group: everyone else not in that group
		* To execute a script, you need read and execute permissions on a file
* Run with `./intro.sh`

What is the Shebang?
* !# = Shebang
 * Lists path to interpreter
 * Commands in script will be executed by `./bin/bash`
 * If no path is provided, it will use the current shell
 * Always supply the interpreter!

 Variables
 * A name/value pair
 * Don’t need to specify types
 * Can only contain letters, numbers, and underscores; cannot start with a digit
 * By convention, use all capitals
 * Use variable using `${}`
 * Can omit the braces: `$VAR`
   * Can’t do this if you want to directly put content after the variable

### Resources Used
- [Udemy Containers 101 Course](https://www.udemy.com/containers-101/)
  - I started join through the advanced section of this course, starting with the Multi-Stage
  Build tutorial. The style of this tutorial was a bit challenging to follow, and the learning
  curve was far more significant than the first part of this course. I ended up only doing the first couple
  sections of the advanced portion, as I found it was too complex to be worth investing time into.
- [Katacoda Docker Course](https://www.katacoda.com/courses/docker)
  - I did a couple of the Katacoda Docker scenarios to enhance my Docker knowledge. These were a great resource, 
  similar to the Katacoda Kubernetes course. The scenarios were all interactive and browser-based, meaning there was
  no risk of mucking anything up locally. Additionally, they were concise and easy to follow.
- [Bash Shell Scripting Course](https://www.shellscript.sh)
  - I followed this course to learn some basic scripting techniques for Linux. It was a great resource. Very
  easy to follow, and lots of practical examples!
