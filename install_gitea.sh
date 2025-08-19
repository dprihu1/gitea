#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install -y git sqlite3 wget

# Create git user
sudo adduser --system --shell /bin/bash --gecos 'Git Version Control' --group --disabled-password --home /home/git git

# Create directories
sudo mkdir -p /var/lib/gitea/{custom,data,log}
sudo chown -R git:git /var/lib/gitea/
sudo chmod -R 750 /var/lib/gitea/
sudo mkdir -p /etc/gitea
sudo chown root:git /etc/gitea
sudo chmod 770 /etc/gitea

# Download Gitea
wget -O gitea https://dl.gitea.com/gitea/1.21.11/gitea-1.21.11-linux-amd64
chmod +x gitea
sudo mv gitea /usr/local/bin/

# Create systemd service
sudo tee /etc/systemd/system/gitea.service > /dev/null <<EOF
[Unit]
Description=Gitea (Git with a cup of tea)
After=network.target

[Service]
RestartSec=2s
Type=simple
User=git
Group=git
WorkingDirectory=/var/lib/gitea/
ExecStart=/usr/local/bin/gitea web --config /etc/gitea/app.ini
Restart=always
Environment=USER=git HOME=/home/git GITEA_WORK_DIR=/var/lib/gitea/

[Install]
WantedBy=multi-user.target
EOF

# Reload and start Gitea
sudo systemctl daemon-reload
sudo systemctl enable --now gitea

echo "Gitea installation complete. Access it at http://<your-server-ip>:3000"
