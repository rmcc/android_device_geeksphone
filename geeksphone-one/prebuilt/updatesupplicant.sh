#!/system/bin/sh

grep -q "ctrl_interface=DIR" /data/misc/wifi/wpa_supplicant.conf
if [ $? -ne 0 ]; then
	echo "Nothing to do"
	exit 0
else
	echo "File needs update"
fi

sed -n '1h;1!H;${;g;s/ctrl_interface=DIR.*update_config=1/update_config=1\nctrl_interface=wlan0\neapol_version=1\nap_scan=1\nfast_reauth=1/g;p;}' /data/misc/wifi/wpa_supplicant.conf > /data/local/wpa_supp.tmp && mv /data/local/wpa_supp.tmp /data/misc/wifi/wpa_supplicant.conf

