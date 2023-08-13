# Windows Subsystem Linux (WSL 1) Git Installation and Configuration

The purpose of this document is to provide step by step guidance for installing and configuring `Git` on WSL.

Tools like Visual Studio Code or Visual Studio.NET will be using Windows 10 `git`.
We can setup Visual Studio Code command prompt to use `bash.exe` of the WSL.
Windows `Git` provides with Credential caching and doesn't require to be login.

```bash
    "terminal.integrated.shell.windows": "C:\\Windows\\System32\\bash.exe",
```

## Install

```bash
    sudo apt install git
```

## Global configurations

[How to use GIT and other Linux tools in WSL on Windows](https://medium.com/faun/how-to-use-git-and-other-linux-tools-in-wsl-on-windows-4c0bffb68b35)

```bash
    git config --global user.email "@kingdavidconsulting.com"
    git config --global user.name "kdcllc"

    # The core.autocrlf=input setting is pretty crucial. It can break things you install over git (like rbenv).
    git config --global core.autocrlf input

    # without using SSH
    git config --global credential.helper cache
```

## Project based configurations

```bash
    git config user.email "@kingdavidconsulting.com"
    git config user.name "kdcllc"
```

## SSH Authentication

[How to Authenticate with github using ssh](https://github.com/spences10/cheat-sheets/blob/master/git.md#how-to-authenticate-with-github-using-ssh)

- Generating new SSH Key for Github

```bash
    ssh-keygen -t rsa -b 4096 -C "@kingdavidconsulting.com"
```

[Use SSH key authentication with Azure](https://docs.microsoft.com/en-us/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=vsts)

- Generating new SSH Key for Azure Repos

```bash
    ssh-keygen -C "@kingdavidconsulting.com"
```

- Add the key to Git Agent

```bash
    # To see if existing SSH keys are present
    ls -al ~/.ssh

    # Check if agent is running
    eval $(ssh-agent -s)

    # Add the certificate to the agent
     ssh-add ~/.ssh/id_rsa
```

## Remove files from history

This is useful especially if there is a neeed to remove a large file

```bash
    git filter-branch --index-filter  "git rm -rf --cached --ignore-unmatch _file_name"
    git update-ref -d refs/original/refs/heads/master
```