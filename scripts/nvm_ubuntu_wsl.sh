#!/bin/bash
touch ~/.bashrc
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash

# restart bash
# nvm install node