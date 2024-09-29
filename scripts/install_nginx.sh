#!/bin/bash

# Update package repository and install NGINX
if [ -f /etc/system-release ] && grep -q "Amazon Linux" /etc/system-release; then
    # For Amazon Linux 2
    sudo amazon-linux-extras install nginx1 -y
elif [ -f /etc/os-release ] && grep -q "Amazon Linux 2023" /etc/os-release; then
    # For Amazon Linux 2023
    sudo dnf install nginx -y
fi