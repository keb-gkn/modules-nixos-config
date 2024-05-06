#!/bin/bash

case $1 in

"userPfp")
	userIconPath="$HOME/.face"

	awesomeIconPath="$HOME/.config/awesome/src/assets/userpfp/$USER.png"

	if [[ -f "$userIconPath" ]]; then
		printf "$userIconPath"
		exit
	else
		printf "$awesomeIconPath"
	fi
	;;

"userName")
	fullname="$(getent passwd $(whoami) | cut -d ':' -f 1)"
	user="$(whoami)"
	host="$(hostname)"
	if [[ "$2" == "userhost" ]]; then
		printf "$user@$host"
	elif [[ "$2" == "fullname" ]]; then
		printf "$fullname"
	else
		printf "The Abyss"
	fi
	;;

esac
