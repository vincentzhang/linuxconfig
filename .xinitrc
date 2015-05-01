#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# --------------------------------------------------------
#   Daemons
# --------------------------------------------------------
# start the deamon for rxvt
/usr/bin/urxvtd -q -f -o

# Set up the wallpaper
hsetroot -center ~/Downloads/wallpaper1440.jpg
# Set up the cursor
xsetroot -cursor_name left_ptr
# start xmonad
xmonad

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
# exec xterm
