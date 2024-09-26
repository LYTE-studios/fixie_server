sudo timedatectl set-timezone UTC

sudo docker compose up --build -d

sudo rm /etc/nginx/certificate.crt
sudo rm /etc/nginx/private.key

sudo touch /etc/nginx/certificate.crt
sudo touch /etc/nginx/private.key

sudo cp nginx.conf /etc/nginx/nginx.conf
sudo cp certificate.crt /etc/nginx/certificate.crt
sudo cp private.key /etc/nginx/private.key

sudo systemctl daemon-reload

sudo systemctl restart nginx
sudo systemctl status nginx