# Pull base image.
FROM ubuntu:latest
MAINTAINER TenxCloud Team <service@tenxcloud.com>

# Install base packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nodejs nodejs-legacy npm imagemagick git -y

# Install nodebb
RUN cd /opt && git clone -b v0.8.2 https://github.com/NodeBB/NodeBB nodebb
RUN cd /opt/nodebb && npm install

# Create a mountable volume
VOLUME /opt/nodebb

# Define working directory.
WORKDIR /opt/nodebb

# Expose ports
EXPOSE 80
EXPOSE 443
EXPOSE 4567

# Define default command.
CMD ["node", "app.js"]