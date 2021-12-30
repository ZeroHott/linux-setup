#!/usr/bin/fish

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
sudo unzip -q exa-linux-x86_64-v0.10.1.zip bin/exa -d /usr/local
fisher install jethrokuan/z
fisher install joseluisq/gitnow
fisher install oh-my-fish/theme-l
exit
