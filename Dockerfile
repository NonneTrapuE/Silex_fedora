FROM fedora:38

# see doc about how to use this docker image here:
# https://github.com/silexlabs/Silex/wiki/How-to-Host-An-Instance-of-Silex#docker

# see doc about env vars here:
# https://github.com/silexlabs/Silex/wiki/How-to-Host-An-Instance-of-Silex#environment-variables

# env vars can be overriden using the `-e` option in docker run
ENV ENABLE_FS=true
# ENV ENABLE_FTP=true ENABLE_SFTP=true ENABLE_WEBDAV=true

 RUN dnf update -y \
14 && dnf install -y  gcc-c++ make dnf-plugins-core \
15 && dnf install -y nodejs

COPY . /silex
WORKDIR /silex

RUN npm install
RUN npm run build

EXPOSE 6805
CMD ["npm", "start"]
