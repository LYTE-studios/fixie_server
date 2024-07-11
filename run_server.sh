sudo rm /etc/nginx/certificate.crt
sudo rm /etc/nginx/private.key

sudo touch /etc/nginx/certificate.crt
sudo touch /etc/nginx/private.key

sudo cp nginx.conf /etc/nginx/nginx.conf
sudo cp certificate.crt /etc/nginx/certificate.crt
sudo cp private.key /etc/nginx/private.key

docker run $(docker build -q .)

sudo systemctl daemon-reload

sudo systemctl restart nginx
sudo systemctl status nginx