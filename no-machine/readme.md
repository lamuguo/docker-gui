## NoMachine

fast & cross platform remote desktop

Quick links:

  - [personal plan](https://www.nomachine.com/everybody)
  - [entreprise plan](https://www.nomachine.com/enterprise)

  - [Pricing](https://www.nomachine.com/buyonline):


#### Run NoMachine on docker

[official guide](https://www.nomachine.com/DT08M00099)
(Content copy-pasted below to add code formatting)

How to run NoMachine server v. 4 inside Docker
Given that Docker is installed on the host machine, to run NoMachine server inside Docker it's enough to build an image from the Dockerfile and launch it.

For example to build an image with MATE as desktop environment:

1. Create your image directory, e.g.
  ```shell
  mkdir nomachine
  ```

2. Copy content of the Dockerfile below to: `nomachine/Dockerfile`.

3. Copy content of the wrapper script below to: `nomachine/nxserver.sh` and set executable permissions:

  chmod +x nomachine/nxserver.sh

4. Build the image:

  ```
  docker build -t=nomachine nomachine
  ```

5. Run the container:

  ```
  docker run -d -p 4000:4000  nomachine
  ```

Set a different port if necessary (see points d and e below).

You can specify multiple ports by reiterating the -p option, e.g.

docker run -d -p 4000:4000 -p 22:22



Dockerfile for NoMachine Workstation v. 4 for evaluation

The Dockerfile below assumes you have already downloaded the NoMachine package v. 4.

It uses the following NoMachine Workstation package for evaluation: nomachine-workstation-evaluation_4.6.22_2_amd64.deb and it is just an example that can be easily adapted to whichever other package you want to try.

  a. Replace the name of the package with that of the server you intend to run. Note that a server wrapper script is always requested.

  b. By default it will run a MATE desktop environment, you can adjust it by replacing 'mate-desktop-environment-core'  with the desktop of your choice.

  c. It will create the nomachine user with nomachine as a password, you can specify a different username and password and repeat instructions for creating additional users.

  d. The 'EXPOSE 4000' command opens port 4000, the default port for connections by NX protocol. Set 'EXPOSE 22' if you intend to use connections by SSH protocol. In this case modify the Dockerfile to install openssh-server.

  e. Connections by the web use port 4080 and 4443 by default. Add 'EXPOSE 4080 4443' to let users run web sessions. This applies to NoMachine Cloud Server only.



```dockerfile
# Dockerfile to install NoMachine Workstation Evaluation v. 4 with MATE interface
FROM debian:jessie
ENV DEBIAN_FRONTEND=noninteractive

# Helpers
RUN apt-get update && apt-get install -y vim xterm pulseaudio cups
RUN apt-get install -y  mate-desktop-environment-core
RUN apt-get install -y wget
ADD nomachine-workstation-evaluation_4.6.22_2_amd64.deb /
RUN dpkg -i /nomachine-workstation-evaluation_4.6.22_2_amd64.deb

RUN groupadd -r nomachine -g 433 && \
  useradd -u 431 -r -g nomachine -d /home/nomachine -s /bin/bash -c "NoMachine" nomachine && \
  mkdir /home/nomachine && \
  chown -R nomachine:nomachine /home/nomachine && \
  echo 'nomachine:nomachine' | chpasswd

EXPOSE 4000
ADD nxserver.sh /
ENTRYPOINT ["/nxserver.sh"]
```


The nxserver.sh wrapper script

```bash
#!/bin/sh
/etc/NX/nxserver --startup
tail -f /usr/NX/var/log/nxserver.log
```



IMPORTANT

On some systems, e.g. Ubuntu 14.04, AppArmor blocks restrictively many operations.


If host logs report a message similar to:

apparmor="DENIED" operation="ptrace" profile="docker-default" pid=3004 comm="nxexec" requested_mask="read" denied_mask="read" peer="docker-default"

it's necessary to reconfigure AppArmor to allow NoMachine have access to /proc filesystem.

To do that you may install the AppArmor Utilities if you don't have them already:

```shell
sudo apt-get install apparmor-utils
```

and run:

```shell
sudo aa-complain /etc/apparmor.d/docker
```
