#!/bin/bash

yum update -y

yum install -y httpd

systemctl start httpd

systemctl enable httpd

echo "<h1>Hello World from EC2 User Data!</h1>" > /var/www/html/index.html
