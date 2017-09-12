#!/usr/bin/env bash
# php 7
sudo yum install epel-release
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo yum -y update
sudo yum remove php-*
yum install -y --enablerepo=remi,remi-php71 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt
# apatche
sudo yum install -y httpd
if ! [ -L /var/www ]; then
    sudo cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bck
    sudo sed -i -e 's/\(DocumentRoot \)\".*\"/\1"\/var\/www\/root"/' /etc/httpd/conf/httpd.conf
fi
sudo systemctl start httpd
