#!/bin/bash

RETCODE=$(fw_exists ${IROOT}/dotnetcore.installed)
[ ! "$RETCODE" == 0 ] || { \
source $IROOT/dotnetcore.installed
return 0; }

wget https://dotnetcli.blob.core.windows.net/dotnet/beta/Installers/Latest/dotnet-host-ubuntu-x64.latest.deb
wget https://dotnetcli.blob.core.windows.net/dotnet/beta/Installers/Latest/dotnet-sharedframework-ubuntu-x64.latest.deb
wget https://dotnetcli.blob.core.windows.net/dotnet/beta/Installers/Latest/dotnet-sdk-ubuntu-x64.latest.deb

sudo apt-get install -y liblldb-3.6 liblttng-ust0 libunwind8 clang-3.5
sudo apt-get install -f -y
sudo dpkg -i dotnet-host-ubuntu-x64.latest.deb
sudo dpkg -i dotnet-sharedframework-ubuntu-x64.latest.deb
sudo dpkg -i dotnet-sdk-ubuntu-x64.latest.deb

echo DotnetCore installed


touch $IROOT/dotnetcore.installed

source $IROOT/dotnetcore.installed

