#!/bin/bash


sudo apt update && sudo apt install fail2ban 



echo "скрипт скачался и запустился"
SCRIPT_PATH="$(realpath "$0")"
echo "🧹 Удаляю скрипт: $SCRIPT_PATH"
sudo rm -f "$SCRIPT_PATH"