#!/bin/bash

# Linux Mint かどうか確認
os=$(cat /etc/issue | grep '\n' | awk '{print $1,$2}')
if [[ $os == "Linux Mint" ]]
  then
  echo "Linux Mint を確認しました。"
  else
  echo "Linux Mint を確認できませんでした。スクリプトを終了します。。。"
  exit
fi
  

# git、shutter のインストール
sudo apt install -y git gnome-web-photo libgoo-canvas-perl libimage-exiftool-perl libgtk2-appindicator-perl

# Peek のインストール
sudo add-apt-repository ppa:peek-developers/stable -y && sudo apt update && sudo apt install -y peek
