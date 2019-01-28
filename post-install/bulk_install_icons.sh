#!/bin/bash

VERSION=2019.01.01
CHOICE=$(zenity --list --height="400" --width="400" --title="アイコン一括インストール ${VERSION} " --column 選択 --column アイコン --column リポジトリの追加の有無 \
		"1" "All" 			"No" \
		"2" "Numix Circle" 	"No"  \
		"3" "Crossover" 	"No"  \
		"4" "Franz" 		"No"  \
		"5" "Google_Chrome" "Yes"  \
		"6" "Megasync" 		"Yes" \
		"7" "Opera" 		"Yes"  \
		"8" "Skypeforlinux" "Yes"  \
		"9" "Stremio" 		"No" \
		"10" "Team_viewer" 	"No" \
		"11" "Tor_Browser" 	"Yes"  \
		"12" "Peazip" 		"No" \
		"13" "Peazip" 		"No" \
		"14" "Vivaldi" 		"Yes" \
		"15" "WPS_Office" 	"No" \
		"16" "スペースホルダー" 		"Yes" \
		"17" "スペースホルダー" 	"GetDeb" \
		"18" "スペースホルダー" 	"No" --checklist )
# checkboxes arent displayed if the last row is not properly set.
case "$1" in
        -w|--wide-system)
                TODIR=/usr/share/theme/
                ;;
        *)
                TODIR=~/.icons
                ;;
esac
echo $TODIR

mkdir -p ~/TempDir4Icons
cd ~/TempDir4Icons


IFS="|"
for word in $CHOICE; do 
	
	if [ $word = "All" ]
	then 
		wget --no-check-certificate https://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.3/enu/AdbeRdr9.5.3-1_i386linux_enu.deb
		dpkg -i AdbeRdr9.5.3-1_i386linux_enu.deb
		rm AdbeRdr9.5.3-1_i386linux_enu.deb
	fi
	
	if [ $word = "Numix Circle" ]
	then 
		wget -O numix_circle.zip https://github.com/numixproject/numix-icon-theme-circle/archive/master.zip
		unzip numix_circle.zip
		cd numix-icon-theme-circle-master
		mv Numix-Circle Numix-Circle-Light $TODIR
		cd ..
	fi
	
	if [ $word = "Crossover" ]
	then 
		wget https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_16.2.5-1.deb
		dpkg -i crossover_16.2.5-1.deb
		rm 	crossover_16.2.5-1.deb
	fi
	
	if [ $word = "Franz" ]
	then 
		wget --no-check-certificate https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz
		tar -xvzf Franz-linux-x64-4.0.4.tgz #needs a shortcut
		rm Franz-linux-x64-4.0.4.tgz
	fi
		
	if [ $word = "Google_Chrome" ]
	then 
		wget --no-check-certificate https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		dpkg -i google-chrome-stable_current_amd64.deb
		rm google-chrome-stable_current_amd64.deb	

	fi
	
	if [ $word = "Megasync" ]
	then 
		wget --no-check-certificate https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/megasync-xUbuntu_16.04_amd64.deb
		gdebi -n megasync-xUbuntu_16.04_amd64.deb
		rm megasync-xUbuntu_16.04_amd64.deb

	fi

	if [ $word = "Opera" ]
	then 
		wget https://download3.operacdn.com/pub/opera/desktop/48.0.2685.39/linux/opera-stable_48.0.2685.39_amd64.deb
		dpkg -i opera-stable_48.0.2685.39_amd64.deb
		rm opera-stable_48.0.2685.39_amd64.deb # add repo automatically
	fi
	
	if [ $word = "Peazip" ]
	then 
		wget http://pumath.dl.osdn.jp/peazip/67623/peazip_6.4.1.LINUX.Qt-2_all.deb
		dpkg -i peazip_6.4.1.LINUX.Qt-2_all.deb
		rm peazip_6.4.1.LINUX.Qt-2_all.deb
	fi
	
	if [ $word = "Pusbullet" ]
	then 
		sudo add-apt-repository ppa:atareao/pushbullet
		sudo apt update
		sudo apt install pushbullet-indicator
	fi


	if [ $word = "Skypeforlinux" ]
	then 
		wget https://repo.skype.com/latest/skypeforlinux-64.deb
		dpkg -i skypeforlinux-64.deb 
		rm skypeforlinux-64.deb 

	fi
	
	if [ $word = "Stremio" ]
	then 
		wget http://dl.strem.io/Stremio3.6.5.linux.tar.gz
		tar -xvzf Stremio3.6.5.linux.tar.gz 
		rm Stremio3.6.5.linux.tar.gz # shortcut?

	fi
	
	if [ $word = "Team_viewer" ]
	then 
		wget https://dl.tvcdn.de/download/version_12x/teamviewer_12.0.85001_i386.deb
		dpkg -i teamviewer_12.0.85001_i386.deb
		rm teamviewer_12.0.85001_i386.deb

	fi

	if [ $word = "Tor_Browser" ]
	then 
	wget https://dist.torproject.org/torbrowser/7.0.5/tor-browser-linux64-7.0.5_en-US.tar.xz
	tar -Jxvf tor-browser-linux64-7.0.5_en-US.tar.xz #needs a shortcut
	rm tor-browser-linux64-7.0.5_en-US.tar.xz
	fi
	
		
	if [ $word = "Vivaldi" ]
	then 
		wget https://downloads.vivaldi.com/stable/vivaldi-stable_1.12.955.36-1_amd64.deb
		dpkg -i vivaldi-stable_1.12.955.36-1_amd64.deb
	fi
	
	if [ $word = "Wine" ]
	then 
		apt remove wine*
		sudo dpkg --add-architecture i386
		wget -nc https://dl.winehq.org/wine-builds/Release.key
		sudo apt-key add Release.key
		sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ 
		sudo apt-get update
		sudo apt-get install -y --install-recommends winehq-stable
	fi

	if [ $word = "WPS_Office" ]
	then 
		wget http://kdl1.cache.wps.com/ksodl/download/linux/a21//wps-office_10.1.0.5707~a21_amd64.deb
		dpkg -i wps-office_10.1.0.5707~a21_amd64.deb
		rm wps-office_10.1.0.5707~a21_amd64.deb
	fi
	
	if [ $word = "XvideoThief" ]
	then 
		wget http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb
		dpkg -i getdeb-repository_0.1-1~getdeb1_all.deb
		sudo apt-get update && sudo apt-get install xvst 
		
	fi
	done

	if [ $word = "CustomizedPackages" ]
	then 
		apt-get -f install -y synergy cherrytree audacious smplayer unzip quiterss steam freeplane virtualbox thunar-dropbox-plugin htop aptitude eric glade pidgin-skypeweb kazam  | zenity --text-info --width 500 --height 400 --timeout="3"
		apt-get autoremove 
	fi
	
cd ..
rm -vr TempDir4Icons
cinnamon-settings themes

exit 0
