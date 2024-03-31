#!/bin/bash

# Variables
download_dir="/home/xpan/Downloads/"
download_file="discord_down_temp.tar.gz"

# get the new package
wget -O "${download_dir}${download_file}" 'https://discord.com/api/download/stable?platform=linux&format=tar.gz'

echo "Downloaded into ${download_dir}${download_file}"
sudo tar -xvf "${download_dir}${download_file}" -C /opt

# delete the tar download_file
rm "${download_dir}${download_file}"
