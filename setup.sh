#!bin/bash
set -xe

apt-get update
apt-get upgrade -y

apt-get install \
    htop \
    wormhole \
    fish \
    snap \
    flatpak \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

chsh -s /usr/bin/fish $SUDO_USER

git clone https://gist.github.com/8b1635d6c6d711ff120dbf5808bc2b71.git /home/$SUDO_USER/.upgrade
chmod +x /home/$SUDO_USER/.upgrade/upgrade.sh

echo 'alias up "bash /home/$SUDO_USER/.upgrade/upgrade.sh"' >> /home/$SUDO_USER/.config/fish/config.fish

su $SUDO_USER
