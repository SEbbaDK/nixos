#!/usr/bin/env fish

while true

set --function output

# BT
for d in (bluetoothctl devices | cut -f2 -d' ')
    if bluetoothctl info $d | grep 'Connected: yes' > /dev/null
        set --function btdevice (bluetoothctl info $d | grep -e 'Name: .*' -o | string replace "Name: " "")
    end
end

if [ "$btdevice" != "" ]
    set --function --append output "bt: $btdevice"
else
    set --function --append output "bt: none"
end

# NET
set --function wifidev (nmcli --get-values device,state,type dev | grep -e 'wifi' | string split ":")
set --function wifi (nmcli --get-values in-use,ssid,bars dev wifi list | grep '^\*'| tail -c +3 | string replace ":" " ")

if [ $wifidev[2] = "connected" ]
    set --function --append output "wifi: $wifi"
else
    set --function --append output "wifi: "$wifidev[2]
end

set --function ethernets (nmcli --get-values device,state,type dev | grep -e 'ethernet' | string replace --regex ':[^:]*$' '')

for ethernet in $ethernets
    set --local e (string split ":" $ethernet)
    set --function --append output $e[1]": "$e[2]
end

# VPN
set --function vpn (mullvad status --json | jq .state --raw-output)
set --function --append output "vpn: $vpn"

# BAT
set bat (acpi -b | tail -c +12 | string split "," | string trim)
if [ $bat[1] = "Charging" ]
    set --function indicator "↑"
else if [ $bat[2] = "Discharging" ]
    set --function indicator "↓"
else
    set --function indicator ""
end
set --function --append output "bat: $indicator $bat[2]"

# VOL
set --function vol (math 100 x (wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -e '[0-9.]\+' -o))"%"
if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep MUTED > /dev/null
    set --function vol "muted"
end
set --function --append output "vol: $vol"

# DATE
set --function --append output (date +"%F")
set --function --append output (date +"%T")

string join "  |  " $output

sleep 2
end
