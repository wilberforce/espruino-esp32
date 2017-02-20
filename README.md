# espruino-esp32

These instructions will help you build the Espruino JavaScript firmware for the
ESP32. The firmware for the ESP32 is under heavy development.

The following folder structure will be built in the current directory - suggested name esp32:

```
esp32
  -- xtensa-esp32-elf
  -- Espruino
  -- espruino-esp32
         -- app
         -- esp-idf
```

We will use the `esp32` as the base folder.

## Build instructions

These instructions will describe how to build Espruino for the ESP32 from scratch.

**1. Install the build framework:**

Build framework for building Espruino on ESP32.

The toolchain is required from this is example is linux 64 bit:
https://github.com/espressif/esp-idf/blob/master/docs/linux-setup.rst

```sh
mkdir esp32
cd esp32
curl -Ls https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-61-gab8375a-5.2.0.tar.gz | tar xfz -
```

**2. Build the ESP-IDF:**

The Espressif IoT Development Framework (ESP-IDF) is the official development framework for the ESP32 chip.  This step has linked git submodules.

```sh
git clone https://github.com/wilberforce/espruino-esp32.git
cd espruino-esp32
source setenv.sh
git submodule update --init
cd esp-idf
git submodule update --init
cd ..
cd app
make
cd ../..
```

This will generate a file in `./app/build/` called `espruino_esp32.elf`.

**3. Build The Espruino project:**

The current build is done in the ESP32 branch until out of Alpha

```sh
git clone -b ESP32 https://github.com/espruino/Espruino.git
cd Espruino
make
cd ..
```

You should see a file named `espruino_esp32.elf`.


## How to re-build - for when new updates become available

To update after a update to master on esp-idf, from base esp32 directory:

```sh
cd espruino-esp32
git pull
cd esp-idf/
git submodule update --init
cd ../app
make clean
make
cd ../../Espruino
make clean
make
cd ..
```

## How to flash the firmware to the ESP32

Once you have built Espruino firmware for the ESP32, then you are ready to flash
it to the ESP32.  Follow these instructions:

```sh
# Assume you are starting in the base folder, esp32/
cd espruino-esp32
source setenv.sh
cd app
make flash
```

The flash should will take a minute or two.

With Google Chrome you can install the [Espruino Web IDE](https://chrome.google.com/webstore/detail/espruino-web-ide/bleoifhkdalbjfbobjackfdifdneehpo)
to connect to the ESP32.  

You may need to configure (click the cog in top right of Espruino Web IDE) the
Communications speed to be 115200 baud, instead of 9600.
