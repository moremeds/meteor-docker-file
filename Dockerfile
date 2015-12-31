FROM chenxi/nodejs

# Install Meteor 
RUN curl https://install.meteor.com/ | sh

# Port
ENV PORT 8080
EXPOSE 8080

# Environment Variables

ENV MONGO_URL mongodb://user:password@url:port/db
ENV ROOT_URL http://localhost


RUN mkdir -p /var/deploy; chmod -R 777 /var/deploy;

# Bundle app source
COPY . /app

# Build app
RUN cd /app; meteor build --directory /var/deploy;

RUN cd /var/deploy/bundle/programs/server/; npm install;

# CMD
CMD ["node", "/var/deploy/bundle/main.js"]
