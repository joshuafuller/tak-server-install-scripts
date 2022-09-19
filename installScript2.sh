echo "MAKE SURE YOU ARE RUNNING THIS UNDER TAK USER WITH SU PRIVS: 'su - tak'"
echo " "

echo "This script will begin the install of TAK Server"
read -p "Press any key to begin ..."

echo "Cloning CloudRF Github Docker Install Project..."
git clone https://github.com/Cloud-RF/tak-server.git
sudo chmod +x ~/tak-server/scripts/setup.sh

sudo cp ~/tak-zip/* ~/tak-server
cd ~/tak-server
./scripts/setup.s

