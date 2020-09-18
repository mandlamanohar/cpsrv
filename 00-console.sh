#!/bin/bash
clear
echo -e "************"
echo -e "Console Menu"
echo -e "************"

echo -e "1 - Server Status"
echo -e "2 - WHM Status"
echo -e "3 - Apache Status"
echo -e "4 - Server Status"

read -p "Select your option to continue:" lhoption


if [ "$lhoption" = "1" ] ;
then
wget -O -  https://raw.githubusercontent.com/mandlamanohar/cpsrv/master/01-cpinfo.sh | bash
      elif [ "$lhoption" = "2" ];
        then
        clear
        echo -e "***************************************************"
        echo -e "***************************************************"
        echo -e "           COMING SOON - STAY TUNED                " 
        echo -e "***************************************************"
        echo -e "***************************************************"
      elif [ "$lhoption" = "3" ];
        then
        clear
        echo -e "***************************************************"
        echo -e "***************************************************"
        echo -e "           COMING SOON - STAY TUNED                " 
        echo -e "***************************************************"
        echo -e "***************************************************"
      elif [ "$lhoption" = "4" ];
        then
        clear
        echo -e "***************************************************"
        echo -e "***************************************************"
        echo -e "           COMING SOON - STAY TUNED                " 
        echo -e "***************************************************"
        echo -e "***************************************************"
      elif [ $lhoption > 4 ];
        then
        clear
        echo -e "***************************************************" 
        echo -e "***************************************************" 
        echo -e "             NO SUCH OPTION - SORRY                " 
        echo -e "***************************************************" 
        echo -e "***************************************************" 
fi
