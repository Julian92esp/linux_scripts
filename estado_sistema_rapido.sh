#!/bin/bash

echo "ESTADO DEL SISTEMA"
echo "---------------------"

echo "CPU:"
top -bn1 | grep "Cpu(s)"

echo "Temperatura:"
vcgencmd measure_temp

echo "Memoria:"
free -h

echo "Disco:"
df -h /

echo "Uptime:"
uptime
