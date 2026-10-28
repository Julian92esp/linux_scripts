#!/bin/bash

# Check all services of the system active (root is required)

# The conditional checks if we are super user
if [ "$(id -u)" -ne 0 ]; then
	echo "You must be Root to execute this script"
	exit 1
fi 

# MARIADB

systemctl status mariadb

# SSH

systemctl status ssh

# NGINX

systemctl status nginx
