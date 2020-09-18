#!/bin/bash

echo -e "************"
echo -e "Console Menu"
echo -e "************"

echo -e "1 - Server Status"
echo -e "2 - Server Status"
echo -e "3 - Server Status"
echo -e "4 - Server Status"

echo -e "Select your option to continue:"
read lhoption

if [ "$lhoption" = "1" ] ;
then
echo -e "                             cPanel CPHULK Service        : Running"
else
echo -e "                             cPanel CPHULK Service        : Not Running"
fi
