# `nvm` for wsl2

This utility is must have for `node.js` development. It allows for installation of multiple `node.js` distributions.


## Steps

1. [Install on wsl2](https://github.com/nvm-sh/nvm#install--update-script)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

``` bash
    nvm -v
    nvm list
    nvm use
    nvm install
```

2. Install `node.js` with `nvm`

```bash
    
    # install node
    nvm install 17.8.0
    
    # use the latest nodejs install
    nvm use 17.8.0
    
    # list all installs
    nvm list

    # upgrade npm package
    npm install -g npm@latest
```
