#!/bin/bash

sudo yum install httpd -y
echo "Hello, World!" | sudo tee /var/www/html/index.html > /dev/null
sudo systemctl start httpd
sudo systemctl enable httpd