#!/bin/bash
rm -f ./html/index.html
echo "CPU cores: $(nproc)" "RAM: $(free -h | awk '/Mem/{print $2}')" "DISK_SPACE: $(df -h / | awk 'NR==2{print $2}')" > ./html/index.html

