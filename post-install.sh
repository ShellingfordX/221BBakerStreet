#!/bin/bash

# root 権限で実行されているか確認
if [[ $EUID -ne 0 ]]; then
echo "You must run the script as root or using sudo"
   exit 1
fi

# Linux Mint かどうか確認
os=$(lsb_release -si)
ver=$(lsb_release -sr)
de=$XDG_CURRENT_DESKTOP
if [[ $os == "LinuxMint" ]]
  then
  echo "Linux Mint を確認しました。"
  else
  echo "Linux Mint を確認できませんでした。スクリプトを終了します。。。"
  exit 1
fi
  
# 古い壁紙ゲット
sudo apt install -y mint-backgrounds-* ubuntu-wallpapers-* ubuntustudio-wallpapers xubuntu-community-wallpapers-xenial

# 日本語のあれこれ
sudo apt install -y language-pack-ja language-pack-gnome-ja fonts-takao-gothic fonts-takao-mincho fonts-takao-pgothic fonts-vlgothic fonts-ipafont-gothic fonts-ipafont-mincho libreoffice-l10n-ja libreoffice-help-ja firefox-locale-ja manpages-ja thunderbird-locale-ja ibus-mozc ibus-anthy kasumi ibus-gtk ibus-gtk3 poppler-data cmap-adobe-japan1 fcitx-mozc fcitx-anthy fcitx-frontend-qt5 fcitx-config-gtk fcitx-config-gtk2 fcitx-frontend-gtk2 fcitx-frontend-gtk3 mozc-utils-gui fcitx-frontend-qt4 fcitx-frontend-qt5 libfcitx-qt0 libfcitx-qt5-1 fonts-migmix fonts-ipamj-mincho fonts-horai-umefont fonts-takao xfonts-mona fonts-kouzan-mouhitsu fonts-konatsu
# コーデック類
sudo apt install -y mint-meta-codecs ubuntu-restricted-extras libavcodec-extra libdvd-pkg

# GTX 1060 のドライバーをインストール
sudo add-apt-repository ppa:graphics-drivers/ppa -y && sudo apt update && sudo apt-get install -y nvidia-settings nvidia-410

# Java のインストール
sudo add-apt-repository ppa:linuxuprising/java -y && sudo apt update && sudo apt install oracle-java11-installer -y

# 書庫
sudo apt install -y unace p7zip-rar sharutils rar arj lunzip lzip unar

# git、shotwell、shutter のインストール
sudo apt install -y git shotwell shutter　#gnome-web-photo libgoo-canvas-perl libimage-exiftool-perl libgtk2-appindicator-perl

# Peek のインストール
sudo add-apt-repository ppa:peek-developers/stable -y && sudo apt update && sudo apt install -y peek

# Numix アイコンとテーマ
sudo add-apt-repository ppa:numix/ppa -y && sudo apt update && sudo apt install -y numix-gtk-theme numix-icon-theme-circle

# Google Chrome のインストール
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sudo apt update
sudo apt install -y google-chrome-stable

# Ruby のインストール
sudo apt install -y ruby ruby-dev irb ri rubygems

# Python IDLE3 のインストール
sudo apt install -y idle3

#youtube-dl
sudo apt install -y youtube-dl

# プロファイルのアイコン取得
cd && wget -O ~/.face https://farm5.staticflickr.com/4620/40030405722_60edd303e1_o.png

# 壁紙
wget -O ~/ピクチャ/wallpaper.jpg https://raw.githubusercontent.com/ShellingfordX/221BBakerStreet/master/assets/images/DOA5LR-Shot-01.jpg
if [[ de == "X-Cinnamon" ]]
   then
   gsettings set org.cinnamon.desktop.background picture-uri 'file:///$HOME/ピクチャ/wallpaper.jpg'
fi

# 掃除
sudo apt autoremove

# Things to do manually
echo "壁紙を変更してください\nアイコンを変更してください\nテーマを変更してください"

# Download O Captain Icon set and MEGA with Firefox
firefox -new-tab -url https://drive.google.com/file/d/0ByQnaVw7riBQSUlwMThLTDdxZ00/view -new-tab -url https://mega.nz/sync!linux
