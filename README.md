# ContainNSM
OpenNSM's Docker image collection of NSM tools and software to effectively utilize them. We have 100's of images...

### What?
* Collection of Docker images on [Docker Hub](https://hub.docker.com/u/opennsm/)
* Collection of Dockerfiles in this repo
* Command-line tool to utilize them `./containnsm`

### Why?
* To facilitate training, testing, and research
* Get up and running quickly with NSM tools
* Keep your host filesystem clean
* Repeatability

### Prerequisites

* OSX: Boot2Docker or Docker Toolbox
* Linux: Docker Engine
* Windows: Docker Toolbox, Bash/Cygwin

## Use

![Menu](http://www.open-nsm.net/images/containnsm/containnsm-menu.png)

#### Layout
Directory structure is dead simple: `tool_directory/version_directory/Dockerfile`.

```
...
|-- argus
|   |-- 3.0.6.1
|   |   |-- Dockerfile
|   |-- 3.0.8.1
|       |-- Dockerfile
|-- bro
|   |-- 2.4
|   |   |-- Dockerfile
|   |-- 2.4.1
|       |-- Dockerfile
|-- daemonlogger
|   |-- 1.0.1
|   |   |-- Dockerfile
|   |-- 1.2.0
|   |   |-- Dockerfile
...
```

#### Obtaining Images

Options:

* Pull down an existing image from Docker Hub (recommended)
  * `docker pull opennsm/bro:2.4.1`

* Build a new one from the repository.

  * Specify the relative path to the tool's version to build the Docker image.
    e.g. `./containnsm build bro/2.4.1`

#### Listing Available Images

* List all available images and locations, installed or not
  * `./containnsm list`
* List all installed OpenNSM images
  * `./containnsm listinstalled`
* List available image names and locations by tool, installed or not
  * `./containnsm list bro`
* List installed image names
  * `./containnsm listinstalled bro`

#### Running Containers

Tools are executed in containers with results passed to the host.
Using `./containnsm` we can easily do things like:

* Sniff on a container interface 
* Sniff on a host interface from inside the container
* Read PCAP from host inside the container and display results to the host.
* Write PCAP from container to a file on host

Notes: If a version tag e.g. `:2.8.1` is not specified the latest version of the image
will be used.
Options and arguments passed after `--` are run inside the container.
When using options such as `-r`, `-w`, `-C` an absolute path must be the
argument. Informational messages are written to stderr, if they're bothering you
send them to bitbucket with `2>/dev/null` 

* Enter container with bash shell
  * `./containnsm run -I bro -- bash`
* List network interfaces available in container
  * `./containnsm run -I bro -- ip link`
* Listen on container interface
  * `./containnsm run -I tcpdump -- tcpdump -ni eth0`
* Listen on host interface from container
  * `./containnsm run -I tcpdump -i -- tcpdump -ni eth0`
* Read PCAP from host inside container  
  * `./containnsm run -r /pcaps/ctf.pcap -I tcpdump:4.7.4 -- tcpdump -nr ctf.pcap`
* Create ARGUS file from PCAP in container and write it to the host 
  * `./containnsm run -r $PWD/test.pcap -I argus -- argus -r test.pcap -w test.argus`
* Write Bro logs to current directory on host from PCAP passed to container
  * `./containnsm run -w $PWD -I bro -- bro -r test.pcap`
* Read PCAP from containers looping through all available versions of tcpdump
  * `./containnsm grouprun -r $PWD/nitroba.pcap -I tcpdump -- tcpdump -nnr nitroba.pcap -c 1 udp`

#### Examples

Graph throughput on Docker host's eth0 interface while downloading a Docker
image of Bro 2.4.

* `./containnsm run -I speedometer:2.8 -i -- speedometer -rx eth0`

![Speedometer](http://www.open-nsm.net/images/containnsm/speedometer.png)
