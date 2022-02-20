#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Script need be run as root"
  exit 1
fi

read -p "Insert username: " USERNAME
read -p "Insert full name of account: " FULLNAME
read -p "Insert initial password: " PASSWD

useradd "${USERNAME}" -m -c "${FULLNAME}"

if [ $? -eq 0 ]
  then
    echo "User is created successfully"
  else
    echo "Account is cannot be created"
    exit 1
fi

echo ${PASSWD} | passwd --stdin ${USERNAME}

passwd -e ${USERNAME}
