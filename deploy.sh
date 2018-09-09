#!/bin/sh

ansible-playbook -i inventory.ini my-task.yml -e "hosts_group=nginx-proxy" $@
