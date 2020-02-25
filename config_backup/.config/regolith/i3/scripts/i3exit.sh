#!/usr/bin/env bash
# lock|logout|sleep|hibernate|reboot|shutdown
options="lock|logout|reboot|shutdown"
theme=${1:-$HOME/.config/regolith/rofi/poweroff.rasi}
selection=$(echo -e "${options}" | rofi -sep "|" -dmenu -theme $theme)
case "${selection}" in
  "lock")
    notify-send "i3exit.sh" "lock" -t 1500
    gnome-screensaver-command --lock
    ;;
  "logout")
    notify-send "i3exit.sh" "logout" -t 1500
    gnome-session-quit --logout --no-prompt
    ;;
  "sleep")
    notify-send "i3exit.sh" "suspending" -t 1500
    systemctl suspend
    ;;
  "reboot")
    notify-send "i3exit.sh" "reboot" -t 1500
    systemctl reboot
    ;;
  "shutdown")
    notify-send "i3exit.sh" "shutdown" -t 1500
    systemctl poweroff
    ;;
esac

