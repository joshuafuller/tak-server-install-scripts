echo "MAKE SURE YOU ARE RUNNING THIS UNDER TAK USER WITH SU PRIVS: 'su - tak'"
echo " "

echo "This script will begin the install of TAK Server"
read -p "Press any key to begin ..."

echo "Cloning CloudRF Github Docker Install Project..."
sudo git clone https://github.com/Cloud-RF/tak-server.git
sudo chmod +x ~/tak-server/scripts/setup.sh

sudo cp ~/tak-zip/* ~/tak-server

echo "YOU ARE NOW READY TO RUN THE DOCKER TAK INSTALL SCRIPT"
echo " "
echo "=====> See https://atakhq.com/en/tak-server/setup-guide for detailed guide on what to expect during this stage"
echo " "
cd ~/tak-server
echo "Run the following command to start the script"
echo "./scripts/setup.sh"
