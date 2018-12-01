## Install .NET Core SDK 2.2 Preview

```
sudo apt-get update \
    && apt-get install -y --no-install-recommends \
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu60 \
        liblttng-ust0 \
        libssl1.0.0 \
        libstdc++6 \
        zlib1g 

# Install .NET Core SDK 2.2 Preview

export DOTNET_SDK_VERSION=2.2.100-preview3-009430

curl -SL --output dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_SDK_VERSION/dotnet-sdk-$DOTNET_SDK_VERSION-linux-x64.tar.gz \
&& dotnet_sha512='c74aeec0e141711359e4af0785fa3af457949783233ad07e7afea2f98f34ddfbf9ced56fb29a92b5350381c4698a4fae09865af9ee03ef24195ec659e852a089' \
&& echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
&& mkdir -p $HOME/dotnet \
&& tar -zxf dotnet.tar.gz -C $HOME/dotnet \
&& rm -f dotnet.tar.gz \
&& echo "export DOTNET_ROOT=$HOME/dotnet " >> ~/.bashrc \
&& source ~/.bashrc
```

[https://www.microsoft.com/net/download/dotnet-core/2.2](https://www.microsoft.com/net/download/dotnet-core/2.2)
`Bash Shell: ~/.bash_profile, ~/.bashrc` Edit the appropriate source file for you shell and add :$HOME/dotnet to the end of the exiting PATH statement. If no PATH statement is included, add a new line with export PATH=$PATH:$HOME/dotnet.

Also add export DOTNET_ROOT=$HOME/dotnet to the end of the file.

```bash
    vi ~/.bashrc
```

https://dotnetcli.blob.core.windows.net/dotnet/checksums/2.1.500-sdk-sha.txt
85055728E2433DFDE41D15C85475F2DC6CFDD30242B4B23065B63CB12CC846ACB93C09C000B02B722890CEAC8AC382B40871C78660716CA2339C71052FE52F4E dotnet-sdk-2.1.500-linux-x64.tar.gz


## [Installing Microsoft Artifacts Cred Provider](https://github.com/Microsoft/artifacts-credprovider)

```bash
    sudo curl -SL https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh | bash
```