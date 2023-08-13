# Raspberry PI WI-FI Hotspot with VPN

The following assumptions are made:

- First Raspberry PI configured as VPN server with [PIVPN](http://www.pivpn.io/)
- OpenVPN configuration file is generated.

## Creating `Raspbian` Image on Windows 10

[Rufus](https://rufus.ie/) can be used to create a bootable image for [Raspbian Buster Lite](https://www.raspberrypi.org/downloads/raspbian/)

## Installation

Pre-requisites

```bash
    sudo apt-get update
    sudo apt-get upgrade -y
```

1. Install OpenVPN

```bash
    sudo apt-get install openvpn
```

2. Copy `OpenVPN` file

```bash
    sudo cp connection.ovpn /etc/openvpn/connection.conf

    # or copy from wsl remote machine when logged into raspberry pi
    scp user@:/mnt/c/Users/Root/connection.ovpn /etc/openvpn/connection.conf
```

3. Test the configuration file [OPTIONAL]

```bash
    sudo openvpn connection.ovpn #open another ssh session to see the ifconfig
```

4. Enable `OpenVPN` automatic start

```bash
    sudo systemctl enable openvpn
    sudo systemctl start openvpn
```

5. Installing Hotspot and DNS service

```bash
    sudo apt install hostapd dnsmasq

    # stop services
    sudo systemctl stop hostapd
    sudo systemctl stop dnsmasq
```

6. Configure `WLAN` static IP address

```bash
    # edit 
    sudo nano /etc/dhcpcd.conf

    # add the following to the file
    interface wlan0
        static ip_address=192.168.220.1/24
        nohook wpa_supplicant
    # CTRL+X Y to save the changes

    # restart dhcpcd service
    sudo systemctl restart dhcpcd
```

7. Configure `dnsmasq` `WLAN` interface

```bash
    # back up original configurations first
    sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

    # edit
    sudo nano /etc/dhcpcd.conf

    # add the following to the file
    interface=wlan0                                 # Use interface wlan0  
    server=1.1.1.1                                  # Use Cloudflare DNS  
    dhcp-range=192.168.220.50,192.168.220.150,12h   # IP range and lease time 
```

8. Configure Hotspot

```bash
    
    # edit
    sudo nano /etc/hostapd/hostapd.conf

    # add the following to the file
    interface=wlan0
    driver=nl80211

    hw_mode=g
    channel=6
    ieee80211n=1
    wmm_enabled=0
    macaddr_acl=0
    ignore_broadcast_ssid=0

    auth_algs=1
    wpa=2
    wpa_key_mgmt=WPA-PSK
    wpa_pairwise=TKIP
    rsn_pairwise=CCMP

    # This is the name of the network (UPDATE)
    ssid=[SSID NAME]

    # The network passphrase (UPDATE)
    wpa_passphrase=[PASSWORD]
```

```bash
    # edit
    sudo nano /etc/default/hostapd

    #find:
    #DAEMON_CONF="" 
    
    #replace with:
    DAEMON_CONF="/etc/hostapd/hostapd.conf"
```

9. Configure Raspberry Pi forward all traffic from `wlan0 `connection over to `OpenVPN` `tun0` connection.

```bash
    # edit
    sudo nano /etc/sysctl.conf

    #find:
    #net.ipv4.ip_forward=1

    #replace with:
    net.ipv4.ip_forward=1

```

Create and Save NAT mapping

```bash
    
    # create traffic mapping from wlan to tun0
    sudo iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE

    # save to the file
    sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"

    # enable new rules on start
    # by editing

    sudo nano /etc/rc.local

    #find:
    exit 0
    
    #add above “exit 0”:
    iptables-restore < /etc/iptables.ipv4.nat
```

10. Re-enable and reboot

```bash

    sudo systemctl unmask hostapd
    sudo systemctl enable hostapd
    sudo systemctl start hostapd
    sudo service dnsmasq start

    # reboot
    sudo reboot
```


### Reference

- [Raspberry Pi Wireless Access Point](https://pimylifeup.com/raspberry-pi-wireless-access-point/)
- [Raspberry Pi VPN Access Point: Setup a Basic VPN Router](https://pimylifeup.com/raspberry-pi-vpn-access-point/)