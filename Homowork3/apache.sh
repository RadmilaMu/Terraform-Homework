#!/bin/bash

sudo yum install httpd -y
echo "<html><body><h1>Hello, World!</h1></body></html>" | sudo tee /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd