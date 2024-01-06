# Arduino Cli Cheatsheet
## Installation
```
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
```

## Installing the AVR platform
```
ard core install arduino:avr
```


## Listing connected devices
```
ard board list
```

## Compiling a sketch
```
arduino-cli compile -b arduino:avr:nano path/to/file.ino
```

## Uploading
```
ard upload -v -p /dev/ttyUSB0 --fqbn arduino:avr:nano /path/to/mySketch.ino
ard upload -v -p /dev/ttyUSB0 --fqbn arduino:avr:mega /path/to/mySketch.ino
ard upload -v -p /dev/ttyUSB0 --fqbn arduino:avr:leonardo /path/to/mySketch.ino
```

## Uploading with another bootloader
```
ard upload -v -p /dev/ttyUSB0 --fqbn arduino:avr:nano:cpu=atmega328old /path/to/mySketch.ino
```

## Adding a library
```
ard lib install keyboard(library-name)
```

## Listening to Serial ports
```
ard monitor -p /dev/ttyACM0
```
