# Pull base image.
FROM ubuntu:latest
MAINTAINER TenxCloud Team <service@tenxcloud.com>

# Install base packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nodejs nodejs-legacy npm imagemagick git -y

# Install nodebb
RUN mkdir /data
RUN cd /data && git clone -b v0.8.2 https://github.com/NodeBB/NodeBB nodebb
RUN cd /data/nodebb && npm install

# Create a mountable volume
VOLUME /data

# Define working directory.
WORKDIR /data/nodebb

# Expose ports
EXPOSE 80
EXPOSE 443
EXPOSE 4567

# Define default command.
CMD ["node", "app.js"]