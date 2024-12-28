#!/bin/bash

# install python module needed
yes Y | sudo apt install python3-aiohttp
yes Y | sudo apt install python3-loguru
yes Y | sudo apt install python3-brotli

# populate data that needed for dawn, like token, app_id, and email
read -p "Email: " email
read -p "App ID: " app_id
read -p "Token: " token

# insert input data to config.json
$(sed -i "s/{email}/$email/g" config.json)
$(sed -i "s/{app_id}/$app_id/g" config.json)
$(sed -i "s/{token}/$token/g" config.json)

# run dawn.py
python3 dawn.py
