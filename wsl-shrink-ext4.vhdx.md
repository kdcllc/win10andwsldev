# [Shrink your WSL2 Virtual Disks and Docker Images and Reclaim Disk Space](https://www.hanselman.com/blog/shrink-your-wsl2-virtual-disks-and-docker-images-and-reclaim-disk-space)

## Docker wsl2 images

```bash
    # 1. launch windows terminal with Admin rights
    
    # 2 reclaim docker space
    docker system prune --all
    
    # 3.  shutdown wsl 
    wsl --shutdown

    # 4. optimize
    cd C:\Users\Root\AppData\Local\Docker\wsl\data
    optimize-vhd -Path .\ext4.vhdx -Mode full

    # 5. optimize with diskpart

    diskpart
     select vdisk file="C:\Users\Root\AppData\Local\Docker\wsl\data\ext4.vhdx"
    compact vdisk
```

## Other distributions images

```bash
    # 1. login to wsl
    wsl -d {name} -u {user}

    # 2. size
    sudo du -sh /var/cache/apt/archives
    
    # 3. remove and purge
    sudo apt autoremove --purge

    # 4. find the location of the distr
    Get-ChildItem "HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss" -Recurse

    # 5. shutdown
    wsl --shutdown

    # 6. navigate to distro
    cd C:\Users\Root\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState
    
    # 7. follow the steps from docker image shrink
```