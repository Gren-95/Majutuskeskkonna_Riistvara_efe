#!/bin/bash

ansible-playbook -i inventory/hosts.ini deploy.yml --ssh-common-args='-o StrictHostKeyChecking=no'  
