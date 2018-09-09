#!/bin/bash

set -e
[ -n "$BASH" ] && set -o pipefail

if [ $(id -u) != 0 ]; then
    cat <<-_EOF
        #===================================================#
        |                    !!!ERROR!!!                    |
        | For continue rerun this script as root            |
        |------------- For example: ------------------------|
        |  sudo $(printf '% -44s' $0)|
        #===================================================#
_EOF
    exit 1
fi


KERNEL_NAME=$(uname -s)
if [ "$KERNEL_NAME" = 'Linux' ]; then
    . /etc/os-release
    case $ID in
        ubuntu|debian)
            apt update -qq
            apt install -qqy ansible
        ;;
        centos)
            yum install -y epel-release
            yum install -y ansible sshpass
        ;;
    esac
else
    echo 'ERROR  : Unsupported platform!'
    exit 1
fi
