#!/bin/bash

#run our playbook
podman run --rm -v ~/.ssh:/root/.ssh:ro -v ${PWD}:/work -it localhost/ansible:latest ansible-playbooks -K -i hosts install.yml

