# Configuring SSH for Windows 10 and WSL2

## Windows PowerShell

Steps done once per setup:

```powershell
    # 1. enable the ssh-agent, by default it is disabled
    Set-Service ssh-agent -StartupType Automatic

    # 2. start the service
    Start-Service ssh-agent

    # 3. Get information about the started service.
    Get-Service ssh-agent

    # 4. Generate key
    ssh-keygen -t rsa -b 4096 -C "your_email@kingdavidconsulting.com"

    # 5. add path "Enter a file in which to save the key"
    $ENV:USERPROFILE\.ssh\id_rsa_github

    # 6. Adds profile to the service
    ssh-add $ENV:USERPROFILE\.ssh\id_rsa_github

    # 7. lists all of the profiles added, check that newly added is in the list.
    ssh-add -l

    # 8. if config file doesn't exist create
    $ENV:USERPROFILE\.ssh\config
    Host github.com
        IdentityFile ~/.ssh/id_rsa_github


    # 9. copy the public key to github
    cat $ENV:USERPROFILE\.ssh\id_rsa_github.pub


    # 10 . check the connection after creating the config file
    ssh -vvv git@github.com

    # 11. check the connection
    ssh -T git@github.com


    # delete all of the profiles
    ssh-add -D
```

## MINGW64:Git Bash
[Generating a new SSH key and adding it to the ssh-agent](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
```bash
    # 1. start ssh-agent
    eval $(ssh-agent -s)

    #. 2 generate key
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

    # 3. adds the profile
    ssh-add ~/.ssh/id_rsa_github

    
    cat  ~/.ssh/id_rsa_github.pub
```
Once the windows is closed the session is lost and the following must be re-entered:

```bash
    # 1. start ssh-agent
    eval $(ssh-agent -s)

    # 2. adds the profile
    ssh-add ~/.ssh/id_rsa_github
```



## WSL2

Once Windows Powershell is completed then the following steps can take place:

```bash
    # 1. login to wsl and copy the keys
    cp -r /mnt/c/Users/<username>/.ssh ~/.ssh
    
    # 2. give permission to the key file
    chmod 600 ~/.ssh/id_rsa_github

    # 3. install keychain
    sudo apt install keychain
```

In order to map WSL2 file system:

1. Open cmd type `ubuntu` or any other distribution installed on the windows machine.

2. Then `explorer.exe .` this will open the WSL file location it can be mapped as windows drive.

Then open `~/.bashrc` file in VSCode and add the following to the end of it:

```bash
    eval `keychain --eval --agents ssh id_rsa`
```

The ssh-agent will automaticly will start with the ssh profile loaded.

## References

- [Switching remote URLs from HTTPS to SSH](https://help.github.com/en/github/using-git/changing-a-remotes-url#switching-remote-urls-from-https-to-ssh)

- [Sharing SSH keys between Windows and WSL 2](https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/)

- [Remote Development Tips and Tricks](https://code.visualstudio.com/docs/remote/troubleshooting#_setting-up-the-ssh-agent)