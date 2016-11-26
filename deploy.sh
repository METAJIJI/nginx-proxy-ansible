#!/bin/sh

[ $(id -u) -ne 0 ] && echo "ERROR  : Need root privileges, try run this script via: sudo sh $(basename $0)" && exit 1

# For debugging
#ansible-playbook -i inventory --syntax-check --list-tasks my-task.yml -e "role_name=ansible-role-nginx" -e "hosts_group=hosts_group"

# For deploy
ansible-playbook -i inventory --connection=local --sudo -vvvv my-task.yml -u root -e "role_name=ansible-role-nginx" -e "hosts_group=localhost"
