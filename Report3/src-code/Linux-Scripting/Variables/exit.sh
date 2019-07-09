#!/bin/sh
# This command will fail because it does not exist
/usr/local/bin/my-command
# $? checks the value of the last executed command
if [ "$?" -ne "0" ]; then
  echo "Sorry, we had a problem there!"
fi
