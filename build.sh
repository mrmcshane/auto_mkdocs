#!/usr/bin/env bash

green='\033[32m';
no_colour='\033[0m';

echo -e "${green}[killing whatever is on port 8080]${no_colour}"
podman kill $(podman ps -f publish=8080 -q) # kill whatever is on port 80

echo -e "${green}[build podman image]${no_colour}"
podman build . -t auto_mkdocs

echo -e "${green}[run podman image]${no_colour}"
podman run -d -p 8080:80 auto_mkdocs

echo -e "${green}[opening browser]${no_colour}"
/usr/bin/open -a "/Applications/Google Chrome.app" "http://localhost:8080"
