#!/bin/bash

#COLORS
RED='\033[0;31m'
NC='\033[0m' # No Color

#SERVER
platform=`cat /var/cpanel/envtype`
osver=`cat /etc/*release | head -n 1`
cpucount=`lscpu | grep "CPU(s):" | head -1 | cut -c24-`
cpuname=`lscpu | grep "Model name:" | cut -c24-`
totmem=`awk '/MemTotal/ { printf "%.3f \n", $2/1024/1024 }' /proc/meminfo`
freemem=`awk '/MemFree/ { printf "%.3f \n", $2/1024/1024 }' /proc/meminfo`
apacheversion=`apachectl -V | head -n 1 | cut -c17-`
mysqlver=`mysql -V | cut -c8-`
cpversion=`/usr/local/cpanel/cpanel -V`
cpusers=`cat /etc/trueuserdomains | wc -l`
cpuseraccounts=`cat /etc/userdomains | wc -l`
diskinstalled=`lsblk -io KNAME,TYPE,SIZE,MODEL | grep disk | grep sd | wc -l`
freedisk=`df -H | grep -vE '^Filesystem|tmpfs|cdrom|loop|sda' | awk '{ print $5 " " $1 }'`
pubip=`dig +short myip.opendns.com @resolver1.opendns.com`
totemails=`cat /home/*/etc/*/shadow | wc -l`
cplogin=`whmlogin`
uptime=`uptime | cut -c2-`

#SERVICES
httpd=`systemctl is-active --quiet httpd && echo Service is running`
mysql=`systemctl is-active --quiet mysql && echo Service is running`
dns=`systemctl is-active --quiet named && echo Service is running`
exim=`systemctl is-active --quiet exim && echo Service is running`
dovecot=`systemctl is-active --quiet dovecot && echo Service is running`
mailman=`systemctl is-active --quiet mailman && echo Service is running`
cphulk=`systemctl is-active --quiet cphulkd && echo Service is running`
crond=`systemctl is-active --quiet crond && echo Service is running`
zabbix=`systemctl is-active --quiet zabbix-agent && echo Service is running`
pdns=`systemctl is-active --quiet pdns && echo Service is running`
csf=`systemctl is-active --quiet csf && echo Service is running`
cphulk=`systemctl is-active --quiet cphulkd && echo Service is running`


clear

echo -e "*****************************"
echo -e "Server Information and Status"
echo -e "*****************************"
echo -e "Platform                                                  : $platform"

echo -e "Public IP                                                 : $pubip"

echo -e "Processor Installed                                       : $cpucount CORES"

echo -e "Processor Name                                            : $cpuname"

echo -e "OS Version                                                : $osver"

echo -e "Server Uptime                                             : $uptime"

echo -e "Total Memory                                              : $totmem GB"

echo -e "Free Memory                                               : $freemem GB"

echo -e "Used Disk                                                 : $freedisk"

echo -e "cPanel Version                                            : $cpversion"

echo -e "Apache Version                                            : $apacheversion"

echo -e "MySQL Version                                             : $mysqlver"

echo -e "Login to WHM                                              : $cplogin"

echo -e "No. of accounts                                           : $cpusers"

echo -e "No. of accounts including addon and Subdomains            : $cpuseraccounts"

echo -e "No. of email accounts (ALL DOMAINS)                       : $totemails \n"

echo -e "**************"
echo -e "Service Status"
echo -e "**************"

if [ "$httpd" = "Service is running" ] ;
then
echo -e "                             HTTPD Service                : Running"
else
echo -e "                             HTTPD Service                : Not Running"
fi

if [ "$mysql" = "Service is running" ] ;
then
echo -e "                             MySQL Service                : Running"
else
echo -e "                             MySQL Service                : Not Running"
fi

if [ "$dns" = "Service is running" ] ;
then
echo -e "                             Bind DNS Service             : Running"
else
echo -e "                             Bind DNS Service             : Not Running"
fi

if [ "$pdns" = "Service is running" ] ;
then
echo -e "                             Power DNS Service            : Running"
else
echo -e "                             Power DNS Service            : Not Running"
fi

if [ "$exim" = "Service is running" ] ;
then
echo -e "                             Exim Service                 : Running"
else
echo -e "                             Exim Service                 : Not Running"
fi

if [ "$dovecot" = "Service is running" ] ;
then
echo -e "                             IMAP/POP Service             : Running"
else
echo -e "                             IMAP/POP Service             : Not Running"
fi

if [ "$mailman" = "Service is running" ] ;
then
echo -e "                             MailMan Service              : Running"
else
echo -e "                             MailMan Service              : Not Running"
fi

if [ "$cphulk" = "Service is running" ] ;
then
echo -e "                             cPHULK Service               : Running"
else
echo -e "                             cPHULK Service               : Not Running"
fi

if [ "$crond" = "Service is running" ] ;
then
echo -e "                             CRON Service                 : Running"
else
echo -e "                             CRON Service                 : Not Running"
fi

if [ "$zabbix" = "Service is running" ] ;
then
echo -e "                             Zabbix Agent Service         : Running"
else
echo -e "                             Zabbix Agent CRON Service    : Not Running"
fi

if [ "$csf" = "Service is running" ] ;
then
echo -e "                             CSF Firewall Service         : Running"
else
echo -e "                             CSF Firewall Service         : Not Running"
fi

if [ "$cphulk" = "Service is running" ] ;
then
echo -e "                             cPanel CPHULK Service        : Running"
else
echo -e "                             cPanel CPHULK Service        : Not Running"
fi
echo -e ""
echo -e ""
echo -e ""
echo -e "$RED"
echo -e "This information was generated at `date` on the server `hostname` with the Public IP $pubip ."
echo -e "$NC"

read -p "Press enter to continue"
wget -O -  https://raw.githubusercontent.com/mandlamanohar/cpsrv/master/00-console.sh | bash
