# Docker with Ubuntu, LXDE and VNC Server

This repository contains a Dockerfile to create a Docker container with the Ubuntu operating system, the LXDE graphical interface, and a VNC server.

## Installed Packages

The container is created with the following packages installed:

-   xorg: X Window system for displaying the graphical interface.
-   lxde-core: LXDE graphical environment.
-   lxterminal: Terminal for running commands.
-   dbus-x11: Interprocess communication system.
-   sudo: Utility for running commands with superuser privileges.
-   firefox: Web browser.
-   tightvncserver: Lightweight VNC server.

## How to Run

1.  Make sure you have Docker installed on your machine.
    
2.  Clone this repository to your local machine:
```bash 
git clone git@github.com:brunofinger/VNC-Ubuntu-LXDE.git
```
3.  Navigate to the cloned directory:

```bash 
cd VNC-Ubuntu-LXDE/
``` 

4.  Run the following command to build the Docker image:

```bash 
docker build -t ubuntu-lxde-vnc .
``` 

5.  After the build is complete, run the following command to run the container:

```bash 
docker run -it --rm -p 5901:5901 -e DISPLAY=:1 -v /tmp/.X11-unix:/tmp/.X11-unix ubuntu-lxde-vnc
``` 

This command runs the container in interactive mode (-it), with the --rm option to delete the container when it is stopped. The -p 5901:5901 option maps port 5901 of the container to port 5901 of the local host. The -e DISPLAY=:1 option configures the DISPLAY environment variable to display the graphical interface on the VNC server. The -v /tmp/.X11-unix:/tmp/.X11-unix option mounts the X11 socket in the container.

6.  Open a VNC client on your local machine and connect to the address `localhost:5901`. The default password is "docker".

