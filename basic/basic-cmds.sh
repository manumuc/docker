#
# Docker Version:
$ docker -v
# Output
Docker version 19.03.1, build 74b1e89
#
# Docker modul versions
$ docker version
# Output
Client: Docker Engine - Community
 Version:           19.03.1
 API version:       1.40
 Go version:        go1.12.5
 Git commit:        74b1e89
 Built:             Thu Jul 25 21:21:07 2019
 OS/Arch:           linux/amd64
 Experimental:      false
Server: Docker Engine - Community
 Engine:
  Version:          19.03.1
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.12.5
  Git commit:       74b1e89
  Built:            Thu Jul 25 21:19:36 2019
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.2.6
  GitCommit:        894b81a4b802e4eb2a91d1ce216b8817763c29fb
 runc:
  Version:          1.0.0-rc8
  GitCommit:        425e105d5a03fabd737a126ad93d62a9eeede87f
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683

The info command prints how many containers and images are there along with the information about the operating system, 
kernel version, CPU, Memory, and hostname.
docker info

Output:

Client:
 Debug Mode: false

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 19.03.1
 Storage Driver: overlay2
  Backing Filesystem: xfs
  Supports d_type: true
  Native Overlay Diff: true
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
 Swarm: inactive
 Runtimes: runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 894b81a4b802e4eb2a91d1ce216b8817763c29fb
 runc version: 425e105d5a03fabd737a126ad93d62a9eeede87f
 init version: fec3683
 Security Options:
  seccomp
   Profile: default
 Kernel Version: 3.10.0-957.21.3.el7.x86_64
 Operating System: CentOS Linux 7 (Core)
 OSType: linux
 Architecture: x86_64
 CPUs: 1
 Total Memory: 1.655GiB
 Name: centos
 ID: RZCG:TOSQ:RL7B:A7FF:ASDB:47GR:KN24:BRKF:KYHZ:5WVV:UTOZ:CDSX
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Registry: https://index.docker.io/v1/
 Labels:
 Experimental: false
 Insecure Registries:
  127.0.0.0/8
 Live Restore Enabled: false
 
# Create a Docker Container
# there is a separate command only to create containers but the following command is widely used to create and run containers.
# It uses the fedora latest docker image to create and start a container.
$ docker run -dit --name docker-fedora --hostname="fedora" fedora /bin/bash
#   -d: Run a container in background and print container ID
#   -i: Run a docker container in interactive mode
#   -t: Allocates tty terminal which is required to attach to the container
#   –name: Name of the docker container, can be an release i.e. fedora:29
#   –hostname: Set a host to the container
#   When you issue the command, Docker looks for Fedora image locally, and if it is not found, 
$   it will start downloading the Fedora image from Docker registry. Once the image has been downloaded, 
#   it will start the container.
# Output: 
Unable to find image 'fedora:latest' locally
latest: Pulling from library/fedora
fd2e8b5b2254: Pull complete 
Digest: sha256:d39a02a0f13c1df3bbcb0ccea4021c53b8e0bfd87f701a5115e18ec089814e70
Status: Downloaded newer image for fedora:latest
8bba0f0ffe3a4553212da5c1bbdca0fac35a210c780f92d0df15fba0feec0a60

#
#List Docker Containers: Check the running containers using the below command.
# The -a option will show all containers including stopped ones.
#
$ docker ps
# or
$ docker container list
Output:
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
8bba0f0ffe3a        fedora              "/bin/bash"         About a minute ago   Up About a minute                       docker-fedora

#
#
#
# Access a running Docker Container
# To exit from Docker container shell to detach from the container without stopping it, press CTRL+p and followed by CTRL+q.
#
$ docker attach docker-fedora
# OR
# docker container attach docker-fedora
Output:
[root@centos ~]# docker attach docker-fedora
[root@fedora /]# df -hT
Filesystem     Type     Size  Used Avail Use% Mounted on
overlay        overlay   10G  2.6G  7.5G  26% /
tmpfs          tmpfs     64M     0   64M   0% /dev
tmpfs          tmpfs    848M     0  848M   0% /sys/fs/cgroup
shm            tmpfs     64M     0   64M   0% /dev/shm
/dev/sda1      xfs       10G  2.6G  7.5G  26% /etc/hosts
tmpfs          tmpfs    848M     0  848M   0% /proc/acpi
tmpfs          tmpfs    848M     0  848M   0% /proc/scsi
tmpfs          tmpfs    848M     0  848M   0% /sys/firmware

#
# Check Running Process in Container: top
#
$ docker top docker-fedora
# OR
$ docker container top docker-fedora
Output:
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                3724                3708                0                   07:51               pts/0               00:00:00            /bin/bash

#
# Check Docker Container Statistics: live stream of container's recource usage statistics (similar to Linux top)
#
$ docker stats docker-fedora
# OR
$ docker container stats docker-fedora
Output:
CONTAINER ID        NAME                CPU %               MEM USAGE / LIMIT   MEM %               NET I/O             BLOCK I/O           PIDS
8bba0f0ffe3a        docker-fedora       0.00%               620KiB / 1.655GiB   0.04%               656B / 0B           0B / 0B             1

#
# Copy file/folder from Docker Container to a host systems
#
$ docker cp docker-fedora:/root/tobecopied /root/
# OR
$ docker container cp docker-fedora:/root/tobecopied /root/

#
# Stop Docker Container: KIll sends SIGTERM signa to kill a running container
#
$ docker kill docker-fedora
# OR
$ docker container kill docker-fedora
#
$docker ps -a 
Output:
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                       PORTS               NAMES
8bba0f0ffe3a        fedora              "/bin/bash"         11 minutes ago      Exited (137) 5 seconds ago                       docker-fedora

#
# Start a stopped Docker Container
#
$docker start docker-fedora
# OR
$ docker container start docker-fedora

#
# Restart Docker Container
#
$ docker restart docker-fedora
OR
$ docker container restart docker-fedora

#
# Stop Docker Container: 
#
$ docker stop docker-fedora
# OR
$ docker container stop docker-fedora

#
# Rename Docker Container: change name 
#
$ docker rename docker-fedora MyFedora
# OR
$ docker container rename docker-fedora MyFedora

#
# Remove Docker Container; use -f to force the removal
#
$docker rm MyFedora
# OR
$ docker container rm MyFedora

#
# Search Docker Images in Docker registry i.e. WordPress.
# 
$docker search wordpress
Output:
NAME                                     DESCRIPTION                                     STARS               OFFICIAL            AUTOMATED
wordpress                                The WordPress rich content management system…   3066                [OK]                
bitnami/wordpress                        Bitnami Docker Image for WordPress              115                                     [OK]
tutum/wordpress                          Out-of-the-box WordPress docker image           35                                      
appcontainers/wordpress                  Centos/Debian Based Customizable WordPress C…   34                                      [OK]
aveltens/wordpress-backup                Easily backup and restore your WordPress blo…   16                                      [OK]
centurylink/wordpress                    WordPress image with MySQL removed.             14                                      [OK]
arm32v7/wordpress                        The WordPress rich content management system…   10                                      
appsvcorg/wordpress-alpine-php            This is a WordPress Docker image which can …   7                                       
dalareo/wordpress-ldap                   WordPress images with LDAP support automatic…   6                                       [OK]
bitnami/wordpress-nginx                  Bitnami Docker Image for WordPress with NGINX   6                                       [OK]
wodby/wordpress-php                      PHP for WordPress                               4                                       [OK]

#
# Download (Pull) Docker Images; per default from Docker public registry; can be set to download from private registry
#
$ docker pull wordpress
# OR
$ docker image pull bitnami/wordpress

#
# Upload (Push) Docker Containers to Docker Hub

#
# List Docker Images on the system
#
$docker images
# OR
$ docker image list
Output:
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
bitnami/wordpress   latest              da1f627a8dfd        2 days ago          417MB
wordpress           latest              02126202b6ea        6 days ago          502MB
fedora              latest              ef49352c9c21        10 days ago         246MB
centos              latest              9f38484d220f        5 months ago        202MB
fedora              29                  d09302f77cfc        5 months ago        275MB

#
# Remove Docker Images
#
You can remove downloaded images using rmi or rm command
$ docker rmi wordpress
# OR
$ docker image rm wordpress
Output:
Untagged: wordpress:latest
Untagged: wordpress@sha256:fdecb6fc92b04d88419544722ac1679158c12eb8f519b83b0480a6375e823dec
Deleted: sha256:02126202b6ea3d070a0d2e9ded8ea7cc94073525fba5839204fed4f6de62a527
Deleted: sha256:006265425edfa4451bb0b69607ca56bf05576c5ee7dbfd5abe4382ab67175537
Deleted: sha256:fba7a866c3b6a68aacb937015533cc65fa563988e9b58258ff82c48554cfc609
Deleted: sha256:a8222cc6dc755223abf4af699ae1090020858fcaffd431b32a116c9c1cc0609d
Deleted: sha256:a310023bf66eb8e4118deafdf12c800a98d9a77932906d141839bad1963dd96b
Deleted: sha256:87b8b6fb7a45af0d8c4aec69d808a8d43c0e177e89284289f6a02da4aaa617a7
Deleted: sha256:119f74a6f3f65b1a989e6015579e6ada9916ac20128699bc63c20cf71b5fd8db
Deleted: sha256:8976d948286158c42b155e2ba9a9039a23005db8b67ca5471abaac20d54b7dd4

