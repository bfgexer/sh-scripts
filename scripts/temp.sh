sudo mkdir -p /var/www/finishing.nabegator3000.site/html
sudo chown -R nabegator3000:nabegator3000 /var/www/finishing.nabegator3000.site/html
sudo chown -R www-data:www-data /var/www/finishing.nabegator3000.site
sudo chmod -R 755 /var/www/finishing.nabegator3000.site

sudo apt update && sudo apt install php8.3 php8.3-fpm php8.3-mysql php8.3-zip php8.3-xml php8.3-mbstring php8.3-curl -y
