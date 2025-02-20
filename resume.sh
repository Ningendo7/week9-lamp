#!/bin/bash

sudo yum update -y
sudo yum install git httpd wget unzip -y
sudo systemctl start httpd
sudo systemctl enable httpd
wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
unzip main.zp
cp -r static-resume-main/* /var/www/html/
exit(0)