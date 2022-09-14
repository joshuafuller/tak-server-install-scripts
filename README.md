# tak-server-install-scripts

1. Buy a VPS from somewhere online - CENT OS 7 
2. SSH into the VPS as root (replace 192.168.1.1 with your VPS Server IP)
`ssh root@192.168.1.1`
3. Now that we are connected to a SSH Shell as root, install git so we can clone this repo and use the scripts
`sudo yum install git -y`
4. Clone this repo
`git clone https://github.com/atakhq/tak-server-install-scripts.git`
5. Move into the scripts folder that was just cloned from github, make the script files executable, and run the first script. (linux prevents files from being executable by default for security)
`cd tak-server-install-scripts/`
`sudo chmod +x *`
`./installScript1.sh`
