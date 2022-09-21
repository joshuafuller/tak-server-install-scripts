# tak-server-install-scripts

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


4. Move into the scripts folder that was just cloned from github, make the script files executable, and run the first script. (linux prevents files from being executable by default for security)

`cd tak-server-install-scripts/`

`sudo chmod +x *`

`./installScript1.sh`


5. The first install script will now prompt you to reboot when its done, do it.


6. Connect back to your VPS and login as tak user with SU privs(replace 192.168.1.1 with your VPS Server IP)


`ssh tak@192.168.1.1`


7. Run installScript2.sh to complete the install

`. installScript2.sh`
