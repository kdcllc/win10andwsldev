# Windows 10/11 Open SSH

Enabled the Open SSH and configure powershell to remember the SSH key passphrase.

<https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement?msclkid=6e0329fbb5a711ecb43f813e6a0402cb>

## Setup

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

## Setup configure Powershell to remember the SSH key passphrase

1. Configure Git to use the Windows 10 implementation of OpenSSH

```ps1
    git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe
```

2. Configure SSH to automatically add the keys to the agent on startup by editing the config file found at `$HOME\.ssh\config` (full path - `C`:\Users\%YOUR_USERNAME%\.ssh\config`), and add the following lines:

```dotnetcli
Host *
 AddKeysToAgent yes
 IdentitiesOnly yes
```