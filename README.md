# espruino-esp32


The following folder structure will be built in the current directory - suggested name esp32:

```
esp32 
  -- xtensa-esp32-elf
  -- Espruino
  -- espruino-esp32
         -- app
         -- esp-idf
```
         
To build these three parts:

1. Build framework for building Espruino on ESP32

The toolchain is required from this is example is linux 64 bit:
https://github.com/espressif/esp-idf/blob/master/docs/linux-setup.rst

```
mkdir esp32
cd esp32
curl -Ls https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-59.tar.gz | tar xfz -
PATH=$PATH:`pwd`/xtensa-esp32-elf/bin/
```

2. Set up esp-idf and component framework
```
git clone https://github.com/wilberforce/espruino-esp32.git
cd espruino-esp32
git submodule update --init
cd esp-idf
git submodule update --init
source setenv.sh
cd ../app
make
cd ..
```

3. The Espruino project - the current build is done in the ESP32 branch until out of Alpha
```
git clone https://github.com/espruino/Espruino.git
cd Espruino
git branch ESP32
git checkout ESP32
make
```

To update after a update to master on esp-idf, from base esp32 directory:
```
cd espruino-esp32\esp-idf
git pull
git submodule update --init
cd ../app
make clean
make
cd ../../Espruino
make clean
make
```
