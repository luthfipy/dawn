#!/bin/bash

# install python module if not installed
if ! dpkg -s python3-aiohttp &>/dev/null; then
        echo "aiohttp not installed, installing aiohttp"
        yes Y | apt install python3-aiohttp
        echo "aiohttp installed"
fi

if ! dpkg -s python3-loguru &>/dev/null; then
        echo "loguru not installed, installing loguru"
        yes Y | apt install python3-loguru
        echo "loguru installed"
fi

if ! dpkg -s python3-brotli &>/dev/null; then
        echo "brotli not installed, installing brotli"
        yes Y | apt install python3-brotli
        echo "brotli installed"
fi

# populate data needed, if not set
if cat config.json | grep -q {email}; then
        echo "Please input your email that associated with dawn"
        read -p "Email: " email
        $(sed -i "s/{email}/$email/g" config.json)
fi

if cat config.json | grep -q {app_id}; then
        echo "Please input your app_id"
        read -p "APP ID: " app_id
        $(sed -i "s/{app_id}/$app_id/g" config.json)
fi

if cat config.json | grep -q {token}; then
        echo "Please input your token"
        read -p "Token: " token
        $(sed -i "s/{token}/$token/g" config.json)
fi

# run dawn.py
python3 dawn.py
