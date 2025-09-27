#!/bin/bash

# Variables
PROJECT_FOLDER=vision-capcha-ocr
DATA_PREFIX_PATH=data
STORAGE_FOLDER=$PROJECT_FOLDER/$DATA_PREFIX_PATH

# Change
cd $STORAGE_FOLDER

# Donwload
curl -LO https://github.com/AakashKumarNain/CaptchaCracker/raw/master/captcha_images_v2.zip captcha_images_v2.zip

# Unzip
unzip -qq captcha_images_v2.zip
