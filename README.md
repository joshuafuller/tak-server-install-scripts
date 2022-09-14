# tak-server-install-scripts

1. Buy a VPS from somewhere online - CENT OS 7 
2. SSH into the VPS as root (replace 192.168.1.1 with your VPS Server IP)

`ssh root@192.168.1.1`

When prompted, type 'yes' and hit enter to accept your servers ECDSA key fingerprint:

`The authenticity of host '192.168.1.1 (192.168.1.1)' can't be established.
ECDSA key fingerprint is SHA256:hjgYgfUYTrfdTglkjhHNjlkhIUGYtyfrftyuGUIil.
Are you sure you want to continue connecting (yes/no/[fingerprint])? 
`

3. Now that we are connected to a SSH Shell as root, install git so we can clone this repo and use the scripts

`sudo yum install git -y`

4. Clone this repo

`git clone https://github.com/atakhq/tak-server-install-scripts.git`

5. Move into the scripts folder that was just cloned from github, make the script files executable, and run the first script. (linux prevents files from being executable by default for security)

`cd tak-server-install-scripts/`

`sudo chmod +x *`

`./installScript1.sh`


6. The first install script will now prompt you to reboot when its done, do it.

7a. Wait 1-2mins for the box to reboot then transfer over your tak docker zip file aquired from tak.gov. RUN THIS SCRIPT FROM YOUR LOCAL MACHINE

`./transferTakServerZipLocal.sh`

7b. Alternatively, you can run this command inside '~/tak-zip/' on your TAK Server to download the file from google drive (much faster). 

Replace 'FILEID' with the file id string from the google drive URL in your browser.
  
Replace FILENAME' with the name you want to save the file with, ex: 'takserver-docker-4.7-RELEASE-20.zip'

`sudo wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=FILEID' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=FILEID" -O FILENAME && rm -rf /tmp/cookies.txt`


8. Connect back to your VPS and login as tak user with SU privs(replace 192.168.1.1 with your VPS Server IP)


`ssh root@192.168.1.1`

`su - tak`

9. Run installScript2.sh to complete the install

`./installScript2.sh`
