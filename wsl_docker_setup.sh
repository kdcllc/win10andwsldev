# This Script might need to be run manually line by line.
# Install Docker Daemon/Client

export DOCKER_VERSION=docker-18.09.0.tgz
export DOCKER_COMPOSE_VERSION=1.23.1

curl https://download.docker.com/linux/static/stable/x86_64/${DOCKER_VERSION} > ~/docker.tar.gz
tar xzvf ~/docker.tar.gz
sudo mv ~/docker/docker /usr/local/bin/docker
rm -rf ~/docker
rm -f ~/docker.tar.gz

# Install docker-compose client
sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose

# point client to docker engine running in windows
echo "DOCKER_HOST=tcp://127.0.0.1:2375 ; export DOCKER_HOST" >> ~/.bashrc
source ~/.bashrc

# test clients
docker --version
docker-compose --version