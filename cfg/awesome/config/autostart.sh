#!/bin/bash
cd $(dirname $0)

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
# run nm-applet
run $HOME/.fehbg
run /usr/bin/vmware-user-suid-wrapper
#run picom --config=./picom/picom.conf -b
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run volumeicon
