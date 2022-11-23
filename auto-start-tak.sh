#!/bin/bash

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

