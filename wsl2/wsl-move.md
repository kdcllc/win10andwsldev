# Move wsl vm image to a different machine

Steps to export wsl:

```bash
    # 1. shutdown
    wsl --shutdown

    # 2. display all of the images
    wsl --list -v

    # 3. export
    wsl --export Ubuntu C:\Linux\Ubuntu.tar
```

Steps to import wsl: