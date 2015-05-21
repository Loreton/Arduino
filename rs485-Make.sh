#!/bin/bash

# -------------------------------------------------------------------------
# - Creazione dei LINK logici per insrire le directory con le librerie.
# -------------------------------------------------------------------------
savedDir=$PWD
ARDUINO_LIB='/usr/share/arduino/libraries'
cd $ARDUINO_LIB
    [[ ! -L  "LnFunctions" ]]    && sudo ln -s /home/pi/gitREPO/Ln-RS485/ArduinoLibraries/LnFunctions
    [[ ! -L  "RS485_protocol" ]] && sudo ln -s /home/pi/gitREPO/Ln-RS485/ArduinoLibraries/RS485_protocol
cd $savedDir




[[ "$1" == "" ]] && echo "Enter USB port: ttyUSB0, ttyUSB1, ...." && exit

device=/dev/ttyUSBx
device=$1
action=$2

[[ ! -c "$device" ]] && echo "$device is NOT a character device" && exit
module='nano328'

if [[ ! "$action" =~ [bus] ]]; then
    echo "immettere uno o più dei seguenti parametri:"
    echo "    b = build"
    echo "    u = upload"
    echo "    s = serial read"
    exit
fi

if [[ "$action" =~ "b" ]]; then
    echo "Building ...."
    CMD="ino build -m $module"; echo $CMD; eval $CMD;rCode=$?
    [[ "$rCode" != "0" ]] && echo $rCode && exit
fi

if [[ "$action" =~ "u" ]]; then
    echo "UpLoading ...."
    CMD="ino upload -p $device -m $module"; echo $CMD; eval $CMD;rCode=$?
    [[ "$rCode" != "0" ]] && echo $rCode && exit
fi


if [[ "$action" =~ "s" ]]; then
    echo "Reading serial ...."
    CMD="ino serial -p $device"; echo $CMD; eval $CMD;rCode=$?
    [[ "$rCode" != "0" ]] && echo $rCode && exit
fi
