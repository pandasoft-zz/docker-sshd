#!/bin/sh
set -euo pipefail

# settings

## set password to actual user
if [ -n "${USER_PASS:-}" ] 
then
    echo -e "${USER_PASS}\n${USER_PASS}" | passwd
fi

## set SSH public key
if [ -n "${PUBLIC_KEY:-}" ] 
then
    (umask 0770 && test -d ~/.ssh || mkdir ~/.ssh && chmod 700 ~/.ssh)
    (umask 0770 && touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys)
    echo "${PUBLIC_KEY}" >> ~/.ssh/authorized_keys    
fi

# run ssh daemon
/usr/sbin/sshd -D -e -p "${SSH_PORT}"
