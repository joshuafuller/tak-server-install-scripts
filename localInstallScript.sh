#!/bin/bash
echo "Run this script to begin the install process LOCALLY for TAK Server, it will take a while so please be patient."
read -p "Press any key to begin ..."

#Create TAK user
adduser tak
usermod -aG sudo tak

#Update apt
sudo apt-get update -y

#Install Deps
sudo apt-get install unzip wget git nano openssl net-tools -y

#Determine if amd or arm build and install appropriate Docker build
ARCH=$(dpkg --print-architecture)

if [ $ARCH == "arm64" ];
then
  echo "*******************************"
  echo "*******************************"
  echo "Building for arm64 (RPI/BPI)..."
  echo "*******************************"
  echo "*******************************"
  #Install Docker
  sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get -y install docker-ce
  echo "*******************************"
  echo "*******************************"
  echo "*** DOCKER INSTALLED ***"
  echo "*******************************"
  echo "*******************************"
fi

if [ $ARCH == "amd64" ];
then
  echo "*******************************"
  echo "*******************************"
  echo "Building for amd64..."
  echo "*******************************"
  echo "*******************************"
  #Install Docker
  sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
  sudo apt-get update
  sudo apt-get -y install docker-ce
  echo "*******************************"
  echo "*******************************"
  echo "*** DOCKER INSTALLED ***"
  echo "*******************************"
  echo "*******************************"
fi


#Install Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "*******************************"
echo "*******************************"
echo "*** DOCKER COMPOSE INSTALLED ***"
echo "*******************************"
echo "*******************************"
docker-compose --version

#Start docker, run at system startup
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker tak

echo "*******************************"
echo "*******************************"
echo "Cloning CloudRF Github Docker Install Project..."
echo "*******************************"
echo "*******************************"
cd /home/tak/
git clone https://github.com/Cloud-RF/tak-server.git
echo "*******************************"
echo "*******************************"
echo "Done, updating script permissions"
echo "*******************************"
echo "*******************************"
sudo chown -R tak:tak /home/tak/*
sudo chmod +x ~/tak-server/scripts/setup.sh

#Install TAK Server
cd /home/tak/tak-server
echo " "
echo "*****************************************************************************"
echo "Please move your tak server zip file into $(pwd)"
echo " "
echo "Then login as tak superuser with:"
echo "su - tak"
echo " "
echo "Once Logged in, enter the following command to being the docker install script:"
echo "cd tak-server && ./scripts/setup.sh"
echo " "
echo "*******************************************************************************"
