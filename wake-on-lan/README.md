# Set up Wake-ON-LAN (WOL) server

## Server side
### 1. Check if your server supports WOL

Get network interface (interface-name) and (MAC address)
```
ip link show
```
Interface name is right after the number, for example `enp3s0`. MAC address is right after `link/ether xx:...`. 

Now, check if WOL is enabled
```
sudo ethtool <interface-name> | grep "Wake-on"
```

For example: 
```
sudo ethtool enp3s0  | grep "Wake-on"

Example outputs:
    Supports Wake-on: pumbg
    Wake-on: d
```
The letter `d` means that WOL on the card is disabled. To enable it, use `g`. If nothing is displayed, it means that the card does not support WOL.

### 2. Enable WOL (this is temporary, it will be lost after reboot)
```
sudo ethtool --change enp3s0 wol g
```

### 3. Configure systemd to enable Wake-on-LAN at boot
```
sudo tee /etc/systemd/network/10-enp3s0.link << EOF
[Match]
MACAddress=xx:xx:xx:xx:xx:xx

[Link]
WakeOnLan=magic
EOF
```

### 4. Update the corresponding `/etc/netplan/xxx.yaml` to include `wakeonlan: true` in the network configuration
```
Example: 

network:
  version: 2
  renderer: networkd
  ethernets:
    enp3s0:
      dhcp4: yes
      wakeonlan: true
```
Then run: 
```
sudo netplan apply
```
Restart the server.

### 5. Enable Wake-on-LAN in BIOS. Hold F10, this navigates to BIOS settings and enable Wake-on-LAN. Restart the server.


## Client side
### 1. Install `wakeonlan`

### 2. Send magic packet to the server
```
wakeonlan <server-mac-address>
```

## References
- <https://syslinuxos.com/how-to-configure-wake-on-lan-using-systemd/#:~:text=Wake%2Don%2DLAN%20(WoL,and%20respond%20to%20magic%20packets>

Other
- <https://www.cyberciti.biz/tips/linux-send-wake-on-lan-wol-magic-packets.html>
- <https://technotim.live/posts/wake-on-lan/>

About IP and ports
- <https://apple.stackexchange.com/questions/95246/wake-other-computers-from-mac-osx>
- <https://www.cyberciti.biz/faq/linux-list-network-interfaces-names-command/>

Wifi
- <https://www.makeuseof.com/connect-to-wifi-with-nmcli/>
