#!/bin/bash

sudo yum -y install httpd
sudo service httpd start
sudo chkconfig --add httpd
sudo chkconfig httpd on
sudo echo "<html><h1>Default page apache22 vagrant</h1></html>" > /var/www/html/index.html
