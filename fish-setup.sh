#!/usr/bin/fish

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install simnalamburt/shellder
fisher install jethrokuan/z
wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
sudo unzip -q exa-linux-x86_64-v0.10.1.zip bin/exa -d /usr/local
apt-get install peco
