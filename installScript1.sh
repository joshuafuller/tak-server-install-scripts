#!/bin/bash
echo "Run this script to begin the install process for TAK Server, it will take a while so please be patient."
read -p "Press any key to begin ..."

adduser tak
usermod -aG sudo tak
sudo apt-get update -y

#Install Deps
sudo apt-get install unzip wget git nano openssl net-tools -y

#Install Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt-get update
sudo apt-get -y install docker-ce

#Install Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Start docker, run at system startup
sudo systemctl start docker
sudo systemctl enable docker

sudo groupadd docker
sudo usermod -aG docker tak

sudo mkdir /home/tak/tak-zip
sudo chown tak:tak /home/tak/tak-zip
#copy the install script 2 into tak user folder so we can run it later
sudo cp /root/tak-server-install-scripts/installScript2.sh /home/tak
sudo chown tak:tak /home/tak/installScript2.sh
sudo chmod +x /home/tak/installScript2.sh

#tell user to reboot now and run script 2
echo "=================================================================="
echo "=================================================================="
echo "=================================================================="
echo "******************************************************************"
echo "                                                                   "
echo "Stage 1 of 2 Completed, Please Login as tak superuser: "
echo "su - tak"
echo "                                                                   "
echo "Then run the final script to complete the install process:"
echo ". installScript2.sh"
echo "                                                                   "
echo "******************************************************************"
echo "=================================================================="
echo "=================================================================="

