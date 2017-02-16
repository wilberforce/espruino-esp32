#!/bin/bash
ESP32_BASE=$(pwd)
export ESP_IDF_PATH=${ESP32_BASE}/esp-idf
export IDF_PATH=${ESP32_BASE}/esp-idf
export ESP_APP_TEMPLATE_PATH=${ESP32_BASE}/app
export ESP32=1
#export RELEASE=1
[[ ":$PATH:" != *":${ESP32_BASE}/../xtensa-esp32-elf/bin:"* ]] && PATH="${ESP32_BASE}/../xtensa-esp32-elf/bin:${PATH}"
