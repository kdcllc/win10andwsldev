# Installing .NET Core SDK

## Installing stable production ready distributions

1. [Install latest .NET Core SDK](https://www.microsoft.com/net/learn/dotnet/hello-world-tutorial#linuxubuntu)

- Register Microsoft key and feed

```bash
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
```

- Install latest stable SDK

```bash
sudo add-apt-repository universe
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1
```

## Installing with a script

[dotnet-install scripts reference](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script)

```bash
    curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 3.0.100
```

## Installing and running several versions of .NET Core SDK on Windows Linux Subsystem (WSL)

While it is possible to use `apt-get` to install the RTM version of dotnet. During the development we often require to have several different versions of SDK to be installed side-by-side.

The easiest way to keep multiple versions of .NET Core SDK running side-by-side is to use `global.json` file.
To Switch between version of SDKs installed run the following commands:

- displayed all installed versions

```bash
    dotnet --list-sdks
```

- #override global.json file

```bash
    dotnet new globaljson --sdk-version 3.0.100-preview-009812 --force
```

### Install .NET Core Required components

1. On Ununtu Linux distro run these command to install pre-req.

```bash
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
```

2. Add the following into `~/.bashrc` [https://www.microsoft.com/net/download/dotnet-core/2.2](https://www.microsoft.com/net/download/dotnet-core/2.2)

- `Bash Shell: ~/.bash_profile, ~/.bashrc` Edit the appropriate source file for you shell and add :$HOME/dotnet to the end of the exiting PATH statement. If no PATH statement is included, add a new line with export PATH=$PATH:$HOME/dotnet.

```bash

    vi ~/.bashrc

    #add value to the end of the existing values
    export DOTNET_ROOT=$HOME/dotnet
    export PATH=$PATH:$HOME/dotnet

```

## Install .NET Core SDKs

1. Retrieve sha hash from
  
> https://dotnetcli.blob.core.windows.net/dotnet/checksums/${DOTNET_SDK_VERSION}-sdk-sha.txt


2. Update `environment` variables and run the `curl` command

```bash
    #https://dotnetcli.blob.core.windows.net/dotnet/checksums/${DOTNET_SDK_VERSION}-sdk-sha.txt

    # export DOTNET_SDK_VERSION=3.0.100-preview6-012264 &&
    # export DOTNET_SHA='047E295F3D7D4C590C906334EC28B844BEF90C2B3FEFE395A23E37E2A7D13955A11CBCF2FC2EE9FFCFD6FD44CEDE4ECD72A6B92258F568D5B328AD46BF0A7BB8'

    # export DOTNET_SDK_VERSION=3.0.100-preview5-011568
    # export DOTNET_SHA='207AF1F3161CBD0864902370475FCAD5B500BF2B7199B06445E7C338053BC7CB0157EE1B4D00A37A351EAE6E209417EE4A15EEACEE086AAC0AC1BE7A62F3AD0B'

    # export DOTNET_SDK_VERSION=3.0.100-preview4-011223
    # export DOTNET_SHA='B416DD4014AD62C7D19413C44738F1CC6152C94570C31DC953BE16BFEADECF449B2AAB7ECC09C9D3FCD12B2D440F281A0C8F1AD0635BC035ADB34C26F8D1E2AE'

    # export DOTNET_SDK_VERSION=3.0.100-preview3-010431
    # export DOTNET_SHA='EAA1208590E60A793CAA8A35E9A26722A4E3BCD8733EA1F79D18C7A777E1A5A8E9D82EDDABBD18B82D8795838E6DFC3B5EC7C4504E58C0C852F2D69D40131CFE'

    #export DOTNET_SDK_VERSION=3.0.100-preview-010184
    #export DOTNET_SHA='DBEFE65B5409A8FCCD5E150560073A0487159016AC52A98EC460EE161A77E63B86E10548E45F3166F1FAF38FA9CF805B6F469DD75F2F008E5E769776C8B63777'

    #export DOTNET_SDK_VERSION=3.0.100-preview-009812
    #export DOTNET_SHA='109E2EA82350DFAC79ED0D5A3FD56B22BD78269AE7099ED288A7893DF4B24DB6E5A7934F4764A5763D3F0777FE8E51A8F2454EA1055700D62111B396FA5E8B39'

    #export DOTNET_SDK_VERSION=2.2.104
    #export DOTNET_SHA='FD03CC4ABEA849EE5E05A035E2888C71D8842E64389DD94D7301E0FCFC189CBED99FE84A6174B657FFE3D328FAA761972C061A339246F63C9BA8FA31EAD2A1B0'

    #export DOTNET_SDK_VERSION=2.2.103
    #export DOTNET_SHA='777ac6dcd0200ba447392e451a1779f0fbfa548bd620a7bba3eebdf35892236c3f10b19ff81d4f64b5bc134923cb47f9cc45ee6b004140e1249582249944db69'

    #export DOTNET_SDK_VERSION=2.2.100
    #export DOTNET_SHA='C8282CE26DBB60872FC5BEB61EE2B6C7D07B87B57554455C017038EE5805596E277E47C721D6C676C8E5ABE3794AB0BD99CFF51147975B88E0B8D4C066FB6E15'

    # export DOTNET_SDK_VERSION=2.2.101
    # export DOTNET_SHA='7D0235469287D55B87AA68FDD8CCE51D2F35FDCCE485701EBF14B53E3AE0A341CDAB8D04AAE066F5E4EBD1BCA7A55C18016DEC4643DE72FD2321FE81C9CB69CD'

    # export DOTNET_SDK_VERSION=2.2.100-preview3-009430
    # export DOTNET_SHA = 'c74aeec0e141711359e4af0785fa3af457949783233ad07e7afea2f98f34ddfbf9ced56fb29a92b5350381c4698a4fae09865af9ee03ef24195ec659e852a089'

    # export DOTNET_SDK_VERSION=3.0.100-preview7-012821 &&
    # export DOTNET_SHA='DF70CA86453CEBA51B480BC8521D6BF76625469CDD3DA6FE782B85F13620D8BEEB34E02EE7AFE2803CD144066E7C685E5A1A9A4005ADC9B2709C69F7F37C9BDC'

    # export DOTNET_SDK_VERSION=3.0.100-preview8-013656 &&
    # export DOTNET_SHA='448C740418F0AB43B3A8D9F7CCB532E71E590692D3B64239C3F21D46DF3A46788B5B824E1A10236E5ABE51D4A5143C27B90D08B342A683C96BD9ABEBC2D33017'

    export DOTNET_SDK_VERSION=3.0.100-preview9-014004 &&
    export DOTNET_SHA='B4E4580250F172C7B14CBCE96D2DE54D13A0B312ED71F86986CC53A9392491347E83CDEFC2805A23BD652FC2CC0658C2E74FC8C05212C3983C19E2ADBC1FE9A3'

    curl -SL --output dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_SDK_VERSION/dotnet-sdk-$DOTNET_SDK_VERSION-linux-x64.tar.gz &&
    dotnet_sha512=$DOTNET_SHA &&
    echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - &&
    tar -zxf dotnet.tar.gz -C $HOME/.dotnet &&
    rm -f dotnet.tar.gz
```

## [Installing Microsoft Artifacts Cred Provider](https://github.com/Microsoft/artifacts-credprovider)

```bash
    sudo curl -SL https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh | bash
```

## [Remove .NET Core Runtime and SDK](https://docs.microsoft.com/en-us/dotnet/core/versions/remove-runtime-sdk-versions?tabs=Linux)

1. Remove is installed via `apt-get`:

```bash
    sudo apt-get remove dotnet-host

    export DOTNET_SDK_VERSION=2.2.103
    sudo rm -rf /usr/share/dotnet/sdk/$DOTNET_SDK_VERSION &&
    sudo rm -rf /usr/share/dotnet/shared/Microsoft.NETCore.App/$DOTNET_SDK_VERSION &&
    sudo rm -rf /usr/share/dotnet/shared/Microsoft.AspNetCore.App/$DOTNET_SDK_VERSION &&
    sudo rm -rf /usr/share/dotnet/host/fxr/$DOTNET_SDK_VERSION
```

2. Remove from manually installed:

```bash
    # 3.0.100-preview3-010431
    # 3.0.100-preview4-011223
    # 3.0.100-preview5-011568
    # 3.0.100-preview6-012264
    export DOTNET_SDK_VERSION=3.0.100-preview6-012264 &&
    export DOTNET_VERSION=3.0.0-preview6-27804-01 &&
    export DOTNET_ASPCORE_VERSION=3.0.0-preview6.19307.2 &&
    sudo rm -rf ~/.dotnet/sdk/$DOTNET_SDK_VERSION &&
    sudo rm -rf ~/.dotnet/optimizationdata/$DOTNET_SDK_VERSION &&
    sudo rm -rf ~/.dotnet/shared/Microsoft.AspNetCore.All/$DOTNET_SDK_VERSION &&
    sudo rm -rf ~/.dotnet\shared\Microsoft.NETCore.App/$DOTNET_VERSION &&
    sudo rm -rf ~/.dotnet/host/fxr/$DOTNET_VERSION &&
    sudo rm -rf ~/.dotnet/packs/Microsoft.AspNetCore.App.Ref/$DOTNET_ASPCORE_VERSION &&
    sudo rm -rf ~/.dotnet/packs/Microsoft.NETCore.App.Host.linux-x64/$DOTNET_VERSION &&
    sudo rm -rf ~/.dotnet/packs/Microsoft.NETCore.App.Ref/$DOTNET_VERSION &&
    sudo rm -rf ~/.dotnet/packs/Microsoft.WindowsDesktop.App.Ref/$DOTNET_VERSION &&
    sudo rm -rf ~/.dotnet/packs/NETStandard.Library.Ref/$DOTNET_VERSION &&
    sudo rm -rf ~/.dotnet/shared/Microsoft.AspNetCore.App/$DOTNET_VERSION
```