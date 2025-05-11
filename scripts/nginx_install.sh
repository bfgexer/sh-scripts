sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
#открываем порты:
sudo ufw allow 'Nginx Full'
sudo ufw status verbose
sudo mkdir -p /var/www/test.nabegator3000.site/html
sudo wget -P /var/www/test.nabegator3000.site/html/ https://raw.githubusercontent.com/bfgexer/sh-scripts/refs/heads/main/html/index.html

sudo tee /etc/nginx/sites-available/test.nabegator3000.site.conf > /dev/null <<EOF
server {
    listen 80;
    server_name test.nabegator3000.site;

    root /var/www/test.nabegator3000.site/html;
    index index.html index.htm;

    access_log /var/log/nginx/test.nabegator3000.site.access.log;
    error_log  /var/log/nginx/test.nabegator3000.site.error.log;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/test.nabegator3000.site.conf /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
sudo systemctl status nginx

echo "скрипт скачался и запустился"
SCRIPT_PATH="$(realpath "$0")"
echo "🧹 Удаляю скрипт: $SCRIPT_PATH"
sudo rm -f "$SCRIPT_PATH"