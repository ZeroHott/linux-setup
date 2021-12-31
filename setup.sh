#!bin/bash
set -xe

# Update Repository Database and Install Packets
echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -

apt-get update
apt-get install \
    htop \
    wormhole \
    fish \
    snap \
    flatpak \
    unzip \
    docker-ctop \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

# Installing Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y

# Installing Docker-Compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Setting Fish as default shell
chsh -s /usr/bin/fish $SUDO_USER

# Cloning update script
git clone https://gist.github.com/8b1635d6c6d711ff120dbf5808bc2b71.git /home/$SUDO_USER/.upgrade

su $SUDO_USER

# aliases
echo 'alias up "bash ~/.upgrade/upgrade.sh"' >> /home/$SUDO_USER/.config/fish/config.fish
echo 'alias ls "exa"' >> /home/$SUDO_USER/.config/fish/config.fish
echo 'alias ll "exa -l"' >> /home/$SUDO_USER/.config/fish/config.fish
echo 'alias la "exa -a"' >> /home/$SUDO_USER/.config/fish/config.fish
echo 'alias lla "exa -la"' >> /home/$SUDO_USER/.config/fish/config.fish
echo 'alias lg "exa -l --git"' >> /home/$SUDO_USER/.config/fish/config.fish
