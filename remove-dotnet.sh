#!/usr/bin/env bash
# chmod +777 remove-dotnet.sh
# 3.0.100-preview3-010431
export DOTNET_SDK_VERSION="3.0.100-preview4-011223"

# 3.0.0-preview3-19153-02
export  DOTNET_ASPNET_APP="3.0.0-preview4-19216-03"

## 3.0.0-preview3-27503-5
export  DOTNET_APP="3.0.0-preview4-27615-1"

echo "~/dotnet/sdk/$DOTNET_SDK_VERSION"

# 1 Remove sdk
rm -rf "~/dotnet/sdk/$DOTNET_SDK_VERSION"
rm -rf "~/dotnet/shared/Microsoft.NETCore.App/$DOTNET_SDK_VERSION"
rm -rf "~/dotnet/shared/Microsoft.AspNetCore.App/$DOTNET_SDK_VERSION" 
rm -rf "~/dotnet/shared/Microsoft.AspNetCore.All/$DOTNET_SDK_VERSION"
rm -rf "~/dotnet/host/fxr/$DOTNET_SDK_VERSION"

# 2. Remove AspNetCore.App
rm -rf "~/dotnet/shared/Microsoft.AspNetCore.App/$DOTNET_ASPNET_APP"

# 3. Remove NetCore.App
rm -rf "~/dotnet/host/fxr/$DOTNET_APP"
rm -rf "~/dotnet/shared/Microsoft.NETCore.App/$DOTNET_APP"