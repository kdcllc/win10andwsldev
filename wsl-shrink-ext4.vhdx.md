# [Shrink your WSL2 Virtual Disks and Docker Images and Reclaim Disk Space](https://www.hanselman.com/blog/shrink-your-wsl2-virtual-disks-and-docker-images-and-reclaim-disk-space)

```bash
    # 1. launch windows terminal with Admin rights
    
    # 2 reclaim docker space
    docker system prune --all
    
    # 3.  shutdown wsl 
    wsl --shutdown

    # 4. optimize
    cd C:\Users\Root\AppData\Local\Docker\wsl\data
    optimize-vhd -Path .\ext4.vhdx -Mode full\

    # 5. optimize with diskpart

    diskpart
     select vdisk file="C:\Users\Root\AppData\Local\Docker\wsl\data\ext4.vhdx"
    compact vdisk
```
