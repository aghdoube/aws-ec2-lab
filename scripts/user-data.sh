#!/bin/bash
dnf update -y

dnf install -y nginx
systemctl start nginx
systemctl enable nginx

echo "<h1>Hello World! This EC2 instance was successfully bootstrapped via automated user-data scripts.</h1>" > /usr/share/nginx/html/index.html
