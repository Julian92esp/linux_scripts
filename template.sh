#!/bin/bash

# Check all services of the system active (root is required)

# The conditional checks if we are super user
if [ "$(id -u)" -ne 0 ]; then
	echo "You must be Root to execute this script"
	exit 1
fi

# SSH

systemctl status ssh | grep "active"

# NGINX

systemctl status nginx | grep "active"
