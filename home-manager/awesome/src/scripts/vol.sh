#!/bin/bash

case $1 in

"volume")
	echo $(LC_ALL=C pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
	;;

"mute")
	echo $(LC_ALL=C pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
	;;

"set_sink")
	$(LC_ALL=C pactl set-default-sink $2)
	;;
esac
