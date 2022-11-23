#!/bin/bash
echo "MAKE SURE YOU ARE RUNNING THIS UNDER TAK USER WITH SU PRIVS: 'su - tak'"
echo " "

echo "This script will begin the install of TAK Server"
read -p "Press any key to begin ..."

echo "Cloning CloudRF Github Docker Install Project..."
git clone https://github.com/Cloud-RF/tak-server.git

echo "Done, updating script permissions"
sudo chmod +x ~/tak-server/scripts/setup.sh


#Handle auto-start setup
while true; do
echo "Do you want to enable auto-start on server reboot? (systemd service)"
echo "Y: Yes"
echo "N: No"
echo ""
read transferoption
        case $transferoption in
                [Yy]* )
                        echo "*****************************************"
                        echo "Setting up auto-start for TAK-Server"
                        echo "*****************************************"
                        echo ""
                        #Create service file
                        sudo tee /etc/systemd/system/tak-server-docker.service >/dev/null << EOF
                        [Unit]
                        Description=TAK Server (Docker)
                        Requires=docker.service
                        After=docker.service
                        [Service]
                        Type=oneshot
                        RemainAfterExit=yes
                        WorkingDirectory=/home/tak/tak-server
                        ExecStart=/usr/local/bin/docker-compose up -d
                        ExecStop=/usr/local/bin/docker-compose down
                        TimeoutStartSec=0
                        [Install]
                        WantedBy=multi-user.target
                        EOF

                        #Enable it to run on reboots
                        sudo systemctl enable tak-server-docker

                        echo "Setup Complete:"
                        echo "TAK Server should now auto start on server reboots" 
                        break
                ;;
                [Nn]* )
                        echo "*****************************************"
                        echo "SKIPPING SYSTEMD AUTO-START SETUP"
                        echo "*****************************************"
                        break
                ;;
                * ) echo "You must select an option to continue";;
        esac
done



#Handle transfer methods
while true; do
echo "How do you want to transfer your TAK Server ZIP File?"
echo "A: Google Drive Transfer"
echo "B: Transfer from Local Machine"
echo ""
read transferoption
        case $transferoption in
                [Aa]* )
                        echo "*****************************************"
                        echo "Using Google Drive Method"
                        echo "*****************************************"
                        echo ""
                        echo "WHAT IS YOUR FILE ID ON GOOGLE DRIVE?"
                        echo "(Right click > Get Link > Allow Sharing to anyone with link > Open share link > 'https://drive.google.com/file/d/<YOUR_FILE_ID_IS_HERE>/view?usp=sharing')"
                        read FILE_ID

                        echo "WHAT IS YOUR FILE NAME?"
                        echo "(ex: takserver-docker-4.7-RELEASE-20.zip)"
                        read FILE_NAME
                        
                        cd ~/tak-server
                        sudo wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=$FILE_ID' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p'
                        sudo wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=t&id=$FILE_ID" -O $FILE_NAME
                        rm -rf /tmp/cookies.txt
                        break
                ;;
                [Bb]* )
                        echo "*****************************************"
                        echo "Transfer from Local Machine Method Chosen"
                        echo "*****************************************"
                        echo ""
                        echo "Please download and run 'transferTakServerZipLocal.sh' on your local machine."
                        echo ""
                        read -p "Once the file is done copying hit enter to resume the install process..."
                        echo ""
                        echo ""
                        sudo cp ~/tak-zip/* ~/tak-server
                        break
                ;;
                * ) echo "You must select a transfer method to continue";;
        esac
done

#Install TAK Server
cd ~/tak-server
./scripts/setup.sh

