# source: https://stefanprodan.com/2016/golang-bash-on-windows-installer/
#!/bin/bash
set -e

GVERSION="1.11.4"
GFILE="go$GVERSION.linux-amd64.tar.gz"

GOPATH="$HOME/go"
GOROOT="/usr/local/go"
if [ -d $GOROOT ]; then
    echo "Installation directory already exists $GOROOT"
    exit 1
fi

mkdir -p "$GOROOT"
chmod 777 "$GOROOT"

wget --no-verbose https://storage.googleapis.com/golang/$GFILE -O $TMPDIR/$GFILE
if [ $? -ne 0 ]; then
    echo "Go download failed! Exiting."
    exit 1
fi

tar -C "/usr/local" -xzf $TMPDIR/$GFILE

touch "$HOME/.bashrc"
{
    echo '# GoLang'
    echo 'export PATH=$PATH:/usr/local/go/bin'
    echo 'export GOPATH=$HOME/go'
    echo 'export PATH=$PATH:$GOPATH/bin'
} >> "$HOME/.bashrc"
source "$HOME/.bashrc"
echo "GOROOT set to $GOROOT"

mkdir -p "$GOPATH" "$GOPATH/src" "$GOPATH/pkg" "$GOPATH/bin" "$GOPATH/out"
chmod 777 "$GOPATH" "$GOPATH/src" "$GOPATH/pkg" "$GOPATH/bin" "$GOPATH/out"
echo "GOPATH set to $GOPATH"

rm -f $TMPDIR/$GFILE