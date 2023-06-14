#!/usr/bin/env bash
# Author: Ibrahim Mkusa
# About: Places card into monitor mode and changes mac addresses

set -e

usage () {
  echo "monitor.sh [card] [up/down] [channel]"
}

if [[ "$2" == "up" ]];then
  # kill all interfering processes
  sudo airmon-ng check kill
  # change mac address
  sudo ifconfig "$1" down
  sudo macchanger -A "$1"
  sudo ifconfig "$1" up
  # start card in monitor mode optionally locked to channel
  sudo airmon-ng start "$1" "$3"
elif [[ "$2" == "down" ]];then
  sudo airmon-ng stop "$1"
  sudo systemctl restart NetworkManager.service || true
  sudo systemctl restart wpa_supplicant.service || true
  nmcli networking on || true
else
  usage
fi



