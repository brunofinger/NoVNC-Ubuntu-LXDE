FROM ubuntu:latest

# Install LXDE packages
RUN apt-get update && apt-get install -y \
    xorg \
    lxde-core \
    lxterminal \
    dbus-x11 \
    sudo \
    firefox

# Install VNC server
RUN apt-get install -y tightvncserver
RUN mkdir /home/docker/.vnc
RUN echo "docker" | vncpasswd -f > /home/docker/.vnc/passwd
RUN chmod 600 /home/docker/.vnc/passwd

# Setup the environment
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
ENV USER docker
ENV HOME /home/docker

# Expose 5901 VNC server
EXPOSE 5901

# Start VNC
CMD ["bash", "-c", "vncserver :1 -depth 24 -geometry 1280x800 && tail -f /home/docker/.vnc/*.log"]
