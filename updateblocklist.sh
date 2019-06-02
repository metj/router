#!/bin/sh

while read domain || [ -n "$domain" ]; do
    nslookup $domain | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | grep -v '127.0.0.1' | while read -r ipdomain ; do
        ipset -A unblock $ipdomain
    done
done < /jffs/configs/domains.txt
