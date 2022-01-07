#!/bin/bash
/usr/sbin/lighttpd -D -f /lighttpd.conf &

url=$URL
transport=$TRANSPORT
refresh=$REFRESH

while true
do
    ffmpeg -y -i $url -r 1 -rtsp_transport $transport -vsync 1 -qscale 1 -f image2 -vframes 1 /tmp/www/snapshot.jpg
    sleep $refresh
done
