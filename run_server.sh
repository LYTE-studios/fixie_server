sudo rm /etc/nginx/certificate.crt
sudo rm /etc/nginx/private.key

sudo touch /etc/nginx/certificate.crt
sudo touch /etc/nginx/private.key

sudo cp nginx.conf /etc/nginx/nginx.conf
sudo cp certificate.crt /etc/nginx/certificate.crt
sudo cp private.key /etc/nginx/private.key

sudo rm /etc/systemd/system/fixie.socket
sudo rm /etc/systemd/system/fixie.service

sudo touch /etc/systemd/system/fixie.socket
sudo touch /etc/systemd/system/fixie.service


sudo cp fixie.socket /etc/systemd/system/fixie.socket
sudo cp fixie.service /etc/systemd/system/fixie.service

sudo systemctl daemon-reload

sudo systemctl start fixie.socket
sudo systemctl start fixie.service

sudo systemctl status fixie.socket

sudo systemctl restart nginx
sudo systemctl status nginx