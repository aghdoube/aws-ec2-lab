#!/bin/bash
dnf update -y
dnf install -y nginx
systemctl start nginx
systemctl enable nginx
echo "<h1>Hallo! Mein Server hat sich selbst eingerichtet.</h1>" > /usr/share/nginx/html/index.html