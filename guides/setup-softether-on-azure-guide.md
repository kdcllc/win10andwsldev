# Installation of SoftEther on Azure Cloud

- Create 18.04-LTS VM with a least 2Gig of RAM. Size Standard B2s

- ssh into vm

1. Upgrade the system

```bash
    sudo apt update
    sudo apt upgrade
```

2. Installing SoftEther

- Fetch softether sources:

```bash
    wget http://www.softether-download.com/files/softether/v4.34-9745-rtm-2020.04.05-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.34-9745-rtm-2020.04.05-linux-x64-64bit.tar.gz
```

- Uncompress the sources

```bash
    tar xzf softether-vpnserver-v4.34-9745-rtm-2020.04.05-linux-x64-64bit.tar.gz
```

- Install from the sources

```bash
    cd vpnserver
    sudo make
```

During the installation process, we will have to type 1 to read the Licence Agreement, type 1 again to confirm that we have read the License Agreement and finally type 1 to agree the License Agreement. After the installation, we can go through the output to confirm that the whole process went correctly without any error. Once everything is done correctly, we will be able to run the vpn server from the installation folder by using this command:

```bash
    sudo ./vpnserver start
```

3. Configuration as a daemon

- Move the installation folder to /usr/local

```bash
    cd ..
    sudo mv vpnserver /usr/local
```

- Give appropriate rights to files

```bash
    cd /usr/local/vpnserver/
    sudo chmod 600 *
    sudo chmod 700 vpnserver
    sudo chmod 700 vpncmd
```

Before going further, let’s check that the vpn server can operate normally on our server. It is important to make this check before starting vpnserver.

- Run the vpncmd command
- Type 3
- Then type check

```bash
     cd /usr/local/vpnserver/
     sudo ./vpncmd
```

- Create a systemd service (Create the file `/lib/systemd/system/vpnserver.service`)
  And put the following content within it:

```
[Unit]
Description=SoftEther VPN Server
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/vpnserver/vpnserver start
ExecStop=/usr/local/vpnserver/vpnserver stop

[Install]
WantedBy=multi-user.target
```
* Start and check the status

```bash
    systemctl start vpnserver
    systemctl status vpnserver
```

4. Prepare SoftEther VPN Server for use

SoftEther offers many use cases: Ad-hoc VPN, Remote access to LAN, LAN to LAN bridge, etc. In this article, we are configuring it for “Remote access to LAN” use. We will first create a `virtual hub`, and then make a kind of link between that `virtual hub` and the server network (the corporate LAN).
Set an admin password for `vpncmd`
For obvious reasons, it’s recommended to immediately set an admin password for `vpncmd` as soon as the the VPN server is installed. This is done through the `vpncmd` utility:
```bash
 cd /usr/local/vpnserver/
 sudo ./vpncmd
```
* Set an admin password for `vpncmd`
For obvious reasons, it’s recommended to immediately set an admin password for `vpncmd` as soon as the the VPN server is installed. This is done through the `vpncmd` utility:

Select 1 for “Management of VPN Server or VPN Bridge”, then just press Enter for the following questions until we get `VPN Server>` prompt. At the command prompt, we type `ServerPasswordSet`.


## Resources

- [Setting up SoftEther VPN Server on Ubuntu 16.04 Xenial Xerus Linux](https://linuxconfig.org/setting-up-softether-vpn-server-on-ubuntu-16-04-xenial-xerus-linux)
- https://github.com/icoexist/softether-autoinstall#open-ports-for-softether-vpn
- https://www.vpnazure.net/en/
- https://www.softether.org/4-docs/2-howto/9.L2TPIPsec_Setup_Guide_for_SoftEther_VPN_Server/5.Mac_OS_X_L2TP_Client_Setup

