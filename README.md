sh скрипты для всякого

скрипт для загрузки

```bash
wget -O /tmp/myscript.sh https://raw.githubusercontent.com/bfgexer/sh-scripts/refs/heads/main/scripts/first_script.sh
chmod +x /tmp/myscript.sh
sudo /tmp/myscript.sh
```

скрипт для ngnix

```bash
mkdir -p ~/tmp
wget -O ~/tmp/myscript.sh https://raw.githubusercontent.com/bfgexer/sh-scripts/refs/heads/main/scripts/nginx_install.sh
chmod +x ~/tmp/myscript.sh
sudo ~/tmp/myscript.sh
```

скрипт для fail2ban

```bash
mkdir -p ~/tmp
wget -O ~/tmp/myscript.sh https://raw.githubusercontent.com/bfgexer/sh-scripts/refs/heads/main/scripts/fail2ban_install.sh
chmod +x ~/tmp/myscript.sh
sudo ~/tmp/myscript.sh
```

удаление nginx и сертификатов

```bash
mkdir -p ~/tmp
wget -O ~/tmp/myscript.sh https://raw.githubusercontent.com/bfgexer/sh-scripts/refs/heads/main/scripts/remove_nginx_certbot.sh
chmod +x ~/tmp/myscript.sh
sudo ~/tmp/myscript.sh
```

установка docker

```bash
mkdir -p ~/tmp
wget -O ~/tmp/myscript.sh https://raw.githubusercontent.com/bfgexer/sh-scripts/refs/heads/main/scripts/docker_install.sh
chmod +x ~/tmp/myscript.sh
sudo ~/tmp/myscript.sh
```
