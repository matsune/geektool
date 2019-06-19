#!/bin/sh
info=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)
SSID=$(echo $info | awk '/\ SSID:/ { for (x=1;x<=NF;x++) if ($x~"^SSID") print $(x+1) }')
txRate=$(echo $info | awk '/\lastTxRate:/ { for (x=1;x<=NF;x++) if ($x~"lastTxRate") print $(x+1) }')
echo "\xEF\x87\xAB $SSID"
echo "\xEF\xA7\x84 ${txRate} Mbps"
