#!/bin/bash
export ESP_IDF_PATH=$(pwd)/esp-idf
export IDF_PATH=$(pwd)/esp-idf
export ESP_APP_TEMPLATE_PATH=$(pwd)/app
export ESP32_BOARD=1
#export RELEASE=1
[[ ":$PATH:" != *":/opt/xtensa-esp32-elf/bin:"* ]] && PATH="/opt/xtensa-esp32-elf/bin:${PATH}"
