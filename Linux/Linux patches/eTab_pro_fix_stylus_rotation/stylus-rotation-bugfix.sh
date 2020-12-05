#!/bin/bash
INTERFACE=org.gnome.Mutter.DisplayConfig
MEMBER=MonitorsChanged
echo "Started"
PREV_ROT="UNDEFINED"
MYDISPLAY=`xrandr --current | grep primary | sed -e 's/ .*//g'`

while :
 do
	sleep 2
	XRANDR=$(xrandr |2>/dev/null grep $MYDISPLAY)
	echo $XRANDR | grep "+0 (" && ROT="normal"
	echo $XRANDR | grep "+0 right (" && ROT="right"
	echo $XRANDR | grep "+0 inverted (" && ROT="inverted"
	echo $XRANDR | grep "+0 left (" && ROT="left"

	[ $ROT == $PREV_ROT ] && continue
	[ $ROT == "normal" ] && xinput set-prop "Goodix Active Stylus Pen Pen (0)" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1 && echo "Rotation changed to normal"
	[ $ROT == "right" ] && xinput set-prop "Goodix Active Stylus Pen Pen (0)" "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1 && echo "Rotation changed to right"
	[ $ROT == "inverted" ] && xinput set-prop "Goodix Active Stylus Pen Pen (0)" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1 && echo "Rotation changed to inverted"
	[ $ROT == "left" ] && xinput set-prop "Goodix Active Stylus Pen Pen (0)" "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1 && echo "Rotation changed to left"  
	PREV_ROT="$ROT"
 done
 echo "Stopped"
 