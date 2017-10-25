FROM ubuntu:14.04

# Install.
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential ruby ruby-dev libxml2-dev libsqlite3-dev libxslt1-dev libpq-dev libmysqlclient-dev zlib1g-dev wget curl unzip && \
    apt-get -y install software-properties-common  && \
    add-apt-repository ppa:git-core/ppa -y && \
    sudo apt-get update && \
    apt-get -y install git

RUN gem install bosh_cli --no-ri --no-rdoc

RUN export BOSH2_CLI_LATEST_VERSION=$(curl https://s3.amazonaws.com/bosh-cli-artifacts/cli-current-version) && \
    wget -O /usr/bin/bosh2 https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-${BOSH2_CLI_LATEST_VERSION}-linux-amd64 && \
    chmod +x /usr/bin/bosh2

RUN export SPRUCE_LATEST_URL=$(curl https://api.github.com/repos/geofffranks/spruce/releases/latest | awk '/download_url.*linux/ {print $2}' | cut -d'"' -f2) && \
    wget -O /usr/bin/spruce ${SPRUCE_LATEST_URL} && \
    chmod +x /usr/bin/spruce

RUN export SPIFF_LATEST_URL=$(curl https://api.github.com/repos/cloudfoundry-incubator/spiff/releases/latest | awk '/download_url.*linux/ {print $2}' | cut -d'"' -f2) && \
    wget -O /usr/bin/spiff ${SPIFF_LATEST_URL} && \
    chmod +x /usr/bin/spiff

RUN wget -O cfcli.tgz "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" && \
    tar -xvzf cfcli.tgz && \
    chmod +x cf && \
    mv cf /usr/bin

RUN export BOSH_INIT_LATEST_URL=$(curl https://api.github.com/repos/cloudfoundry/bosh-init/releases/latest | awk '/download_url.*linux/ {print $2}' | cut -d'"' -f2) && \
    wget -O /usr/bin/bosh-init ${BOSH_INIT_LATEST_URL} && \
    chmod +x /usr/bin/bosh-init
