# `nvm` for windows

This utility is must have for `node.js` development. It allows for installation of multiple `node.js` distributions.

## Steps

1. Download and install [`nvm for windows`](https://github.com/coreybutler/nvm-windows/releases) 
or simply use `winget install CoreyButler.NVMforWindows`

``` ps1
    nvm -v
    nvm list
    nvm use
    nvm install
```

2. Install `node.js` with `nvm`

```ps1
    
    # install node
    nvm install 17.8.0
    
    # use the latest nodejs install
    nvm use 17.8.0
    
    # list all installs
    nvm list

    # upgrade npm package
    npm install -g npm@latest
```
