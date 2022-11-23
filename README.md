# TAK Server 15min Install Script Packages

## 10min Video Walkthru: https://youtu.be/6r0QeBpZpjY

## You should be able to get a TAK server up and running within 15mins of starting these scripts (assuming you already have the TAK Server ZIP downloaded and stored on google drive or your local machine)


# LOCALLY HOSTED INSTALL (Ubuntu 20.04 & ARM Builds like RPI/BPI)

1. Clone this repo

`git clone https://github.com/atakhq/tak-server-install-scripts.git`

2. Move into the scripts folder that was just cloned from github, make the script files executable, and run the local install script. 
(linux prevents files from being executable by default for security)

`cd tak-server-install-scripts/ && sudo chmod +x * && sudo ./localInstallScript.sh`




# SERVER INSTALL (CLOUD) (Ubuntu 20.04)

1. Buy a VPS from somewhere online - UBUNTU 20.04LTS

2. SSH into the VPS as root (replace 192.168.1.1 with your VPS Server IP)

`ssh root@192.168.1.1`

When prompted, type 'yes' and hit enter to accept your servers ECDSA key fingerprint:

`The authenticity of host '192.168.1.1 (192.168.1.1)' can't be established.
ECDSA key fingerprint is SHA256:hjgYgfUYTrfdTglkjhHNjlkhIUGYtyfrftyuGUIil.
Are you sure you want to continue connecting (yes/no/[fingerprint])? 
`

3. Clone this repo

`git clone https://github.com/atakhq/tak-server-install-scripts.git`


4. Move into the scripts folder that was just cloned from github, make the script files executable, and run the first script. 
(linux prevents files from being executable by default for security)

`cd tak-server-install-scripts/ && sudo chmod +x * && ./installScript1.sh`


5. The first install script will now prompt you to Login as tak superuser and run the final script.


`su - tak`

`. installScript2.sh`

# Enable TAK Server Docker Auto-Start on existing installations

Download and run `auto-start.sh`

New Installations will prompt you if you want this enabled and do it for you under a new service called "tak-server-docker"
