#!/bin/bash

PACKAGE_NAME="sl"

if dpkg-query -W -f='${Status}' $PACKAGE_NAME 2>/dev/null | grep -q "ok installed"; then
    echo "The Package $PACKAGE_NAME is installed"
else 
    echo "Please install the following package: $PACKAGE_NAME"
    exit 1
fi

while true; do
    sl
done
