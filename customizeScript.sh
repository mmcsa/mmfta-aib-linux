#!/bin/bash -e

# Add repo key for az cli
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Add az cli repo for yum
sudo sh -c 'echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'

# install az cli
sudo yum install azure-cli --assumeyes

# Add preview banner to MOTD
cat >> /etc/motd << EOF
*******************************************************
**            This VM was built from the:            **
**      !! AZURE VM IMAGE BUILDER Custom Image !!    **
**         You have just been Customized :-)         **
*******************************************************
EOF