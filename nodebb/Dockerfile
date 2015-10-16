# Pull base image.
FROM node
MAINTAINER TenxCloud Team <service@tenxcloud.com>

# Install nodebb
RUN mkdir -p /opt/nodebb
ADD . /opt/nodebb

# Define working directory.
WORKDIR /opt/nodebb

# Install the dependencies modules
RUN npm install

# Expose ports
EXPOSE 4567

# Define default command.
CMD ["node", "app.js"]