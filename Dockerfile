FROM ubuntu:14.04

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install build-essential ruby ruby-dev libxml2-dev libsqlite3-dev libxslt1-dev libpq-dev libmysqlclient-dev zlib1g-dev wget curl && \
  gem install bosh_cli --no-ri --no-rdoc && \
  wget -O /usr/bin/bosh https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.42-linux-amd64 && \
  chmod +x /usr/bin/bosh && \
  apt-get -y install unzip && \
  wget -O /usr/bin/fly "http://192.168.100.4:8080/api/v1/cli?arch=amd64&platform=linux" && \
  chmod 755 fly && \
  wget -O /usr/bin/spruce "https://github.com/geofffranks/spruce/releases/download/v1.1.2/spruce-linux-amd64" && \
  chmod 755 spruce && \
  wget -O /usr/bin/spiff "https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64" && \
  chmod 755 spiff && \
  wget -O cfcli.tgz "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" && \
  tar -xvzf cfcli.tgz && \
  chmod 755 cf && \
  mv cf /usr/bin && \
  apt-get -y install software-properties-common  && \
  add-apt-repository ppa:git-core/ppa -y && \
  sudo apt-get update && \
  apt-get -y install git && \
  wget -O bosh-init https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.81-linux-amd64 && \
  chmod 755 bosh-init && \
  mv bosh-init /usr/bin
