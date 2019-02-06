#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo エラー: sudo 付きで実行して下さい。
	exit
fi

# 依存関係を満たす
if [ $(dpkg-query -W -f='${Status}' plymouth-x11 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	sudo apt install -y plymouth-x11
fi

sudo plymouthd
sudo plymouth --show-splash
sleep ${1:-2}
sudo plymouth quit
