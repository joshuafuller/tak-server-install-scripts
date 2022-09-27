echo "Run this script to begin the install process LOCALLY for TAK Server, it will take a while so please be patient."
read -p "Press any key to begin ..."

#Create TAK user
adduser tak
usermod -aG sudo tak

#Update apt
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

echo " "
echo "Cloning CloudRF Github Docker Install Project..."
cd ~
git clone https://github.com/Cloud-RF/tak-server.git

echo " "
echo "Done, updating script permissions"
sudo chmod +x ~/tak-server/scripts/setup.sh

cd ~/tak-server
echo " "
echo "*********************************************************************************************"
echo "Please move your tak server zip file into ($pwd), then press enter to start the install"
echo "*********************************************************************************************"
read RUNME

#Install TAK Server
./scripts/setup.sh
