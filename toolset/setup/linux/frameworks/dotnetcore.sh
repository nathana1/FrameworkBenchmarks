#!/bin/bash

RETCODE=$(fw_exists ${IROOT}/dotnetcore.installed)
[ ! "$RETCODE" == 0 ] || { \
source $IROOT/dotnetcore.installed
return 0; }

CORE_HOME=$IROOT/dotnetcore
if [ -d $CORE_HOME ]; then
    rm -rf $CORE_HOME
fi

mkdir $CORE_HOME
cd $CORE_HOME

fw_get -o dotnet-host-ubuntu-x64.latest.deb https://dotnetcli.blob.core.windows.net/dotnet/beta/Installers/Latest/dotnet-host-ubuntu-x64.latest.deb
fw_get -o dotnet-sharedframework-ubuntu-x64.latest.deb https://dotnetcli.blob.core.windows.net/dotnet/beta/Installers/Latest/dotnet-sharedframework-ubuntu-x64.latest.deb
fw_get -o dotnet-sdk-ubuntu-x64.latest.deb https://dotnetcli.blob.core.windows.net/dotnet/beta/Installers/Latest/dotnet-sdk-ubuntu-x64.latest.deb

sudo apt-get install -y liblldb-3.6 liblttng-ust0 libunwind8 clang-3.5
sudo apt-get install -f -y
sudo dpkg -i dotnet-host-ubuntu-x64.latest.deb
sudo dpkg -i dotnet-sharedframework-ubuntu-x64.latest.deb
sudo dpkg -i dotnet-sdk-ubuntu-x64.latest.deb
dotnet --version

touch $IROOT/dotnetcore.installed

source $IROOT/dotnetcore.installed

