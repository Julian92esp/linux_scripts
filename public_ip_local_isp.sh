#!/bin/bash

echo "Pubic IP:"
curl -s ifconfig.me

echo
echo "Local IP:"
hostname -I

echo
echo "ISP:"
curl -s ipinfo.io/org
