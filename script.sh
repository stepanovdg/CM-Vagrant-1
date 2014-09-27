#!/bin/bash

sudo portsnap fetch update
sudo cd /usr/ports/www/apache22/
sudo BATCH=1; make install clean
sudo echo "<html><h1>Default page apache22 vagrant</h1></html>" > /usr/local/www/apache22/data/index.html
sudo /usr/local/etc/rc.d/apache22 start
