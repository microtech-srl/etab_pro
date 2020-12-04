#!/bin/bash
mkdir -p ~/.config/autostart
cp rotation-stylus.desktop ~/.config/autostart/

sudo cp -a stylus-rotation-bugfix.sh /usr/bin/
echo "Login and out again, and the stylus rotation should working."
