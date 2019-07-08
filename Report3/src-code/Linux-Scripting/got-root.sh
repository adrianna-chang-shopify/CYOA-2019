#!/bin/bash

# Determine if the user executing this script is the root user or not.

# Display the UID
echo "Your UID is ${UID}."

# Display if the user is the root user or not.
if [[ "${UID}" -eq 0 ]]
then
  echo "You are the root user."
else
  echo "You are not the root user."
fi

