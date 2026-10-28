#!/bin/bash

read -p "Apagar en cuántos segundos?: " SEC
echo "Apagando en $SEC segundos..."
sleep $SEC
sudo shutdown now
