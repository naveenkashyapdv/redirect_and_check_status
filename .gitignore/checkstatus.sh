#!/bin/bash
filename = 'urls.txt'
while read url
do
    urlstatus=$(curl -Is "$url" | head -n 1 )
	urlredirect=$(curl -w "%{url_effective}\n" -I -L -s -S "$url" -o /dev/null )
    echo "$urlstatus + $urlredirect" >> urlstatus.txt 
	
done < $1
