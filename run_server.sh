sudo rm /etc/systemd/system/api.socket
sudo rm /etc/systemd/system/api.service

sudo touch /etc/systemd/system/api.socket
sudo touch /etc/systemd/system/api.service

sudo cp api.socket /etc/systemd/system/api.socket
sudo cp api.service /etc/systemd/system/api.service

sudo systemctl daemon-reload

sudo systemctl start api.socket
sudo systemctl start api.service

sudo systemctl status api.socket

sudo rm /etc/nginx/certificate.crt
sudo rm /etc/nginx/private.key

sudo touch /etc/nginx/certificate.crt
sudo touch /etc/nginx/private.key

sudo cp nginx.conf /etc/nginx/nginx.conf
sudo cp certificate.crt /etc/nginx/certificate.crt
sudo cp private.key /etc/nginx/private.key

sudo systemctl restart nginx
sudo systemctl status nginx

