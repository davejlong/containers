#!/bin/sh

# Create the config files if they don't exist
if [ -z "$(ls -A /etc/nut)" ]; then
  echo "Copying default nut configuration files"
  cp -R /etc/nut.orig/* /etc/nut
fi

# Setup the user account
echo @"
[upsmon]
  password = password
  upsmon primary
  actions = set
  actions = fsd
  instcmds = all
"@



chgrp -R nut /dev/bus/usb

/usr/sbin/upsdrvctl start
/usr/sbin/upsd
/usr/sbin/upsmon -F
