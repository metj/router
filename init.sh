#!/bin/sh

opkg install dnscrypt-proxy fake-hwclock

echo "no-resolv" > /jffs/configs/dnsmasq.conf.add
echo "server=127.0.0.1#65053" >> /jffs/configs/dnsmasq.conf.add

domains=$(cat domains.txt | tr '\n' '\')
unblock="unblock"
echo "ipset=$domains$unblock" >> /jffs/configs/dnsmasq.conf.add

echo "/opt/etc/init.d/S09dnscrypt-proxy start" >> /jffs/scripts/services-start

cp firewall-start /jffs/scripts/ -f
chmod +x /jffs/scripts/firewall-start

cp wan-start /jffs/scripts/ -f
chmod +x /jffs/scripts/wan-start

cp openvpn-event /jffs/scripts/ -f
chmod +x /jffs/scripts/openvpn-event
