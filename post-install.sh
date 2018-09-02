#!/bin/bash

# root 権限で実行されているか確認
if [[ $EUID -ne 0 ]]; then
echo "You must run the script as root or using sudo"
   exit 1
fi

# Linux Mint かどうか確認
os=$(cat /etc/issue | grep '\n' | awk '{print $1,$2}')
if [[ $os == "Linux Mint" ]]
  then
  echo "Linux Mint を確認しました。"
  else
  echo "Linux Mint を確認できませんでした。スクリプトを終了します。。。"
  exit 1
fi
  

# git、shutter のインストール
sudo apt install -y git shutter　#gnome-web-photo libgoo-canvas-perl libimage-exiftool-perl libgtk2-appindicator-perl

# Peek のインストール
sudo add-apt-repository ppa:peek-developers/stable -y && sudo apt update && sudo apt install -y peek

# Google Chrome のインストール
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/chrome.list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sudo apt update
sudo apt install -y google-chrome-stable

# Ruby のインストール
sudo apt install -y ruby ruby-dev irb ri rubygems

# Python IDLE3 のインストール
sudo apt install -y idle3

# プロファイルのアイコン取得
cd && wget -O ~/.face https://farm5.staticflickr.com/4620/40030405722_60edd303e1_o.png

# 壁紙
wget -O ~/ピクチャ/wallpaper.jpg https://raw.githubusercontent.com/ShellingfordX/221BBakerStreet/master/assets/images/DOA5LR-Shot-01.jpg

# Download O Captain Icon set and MEGA with Firefox
firefox -new-tab -url https://drive.google.com/file/d/0ByQnaVw7riBQSUlwMThLTDdxZ00/view -new-tab -url https://mega.nz/sync!linux

# Things to do manually
echo "壁紙を変更してください\nアイコンを変更してください\nテーマを変更してください"
