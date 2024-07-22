docker build -t fixie_server .

docker stop fixie_server

docker run -dp 127.0.0.1:8080:8080 fixie_server

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