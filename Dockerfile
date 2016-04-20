FROM node:0.12

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app
RUN npm install
EXPOSE 8080

ENV NPM_HOST http://registry.npmjs.org/
ENV PORT 8080
ENV CDN_CACHE_DIR /cdn

RUN mkdir /cdn

WORKDIR /cdn


CMD ["node","/usr/src/app/server.js",">/dev/null"]
