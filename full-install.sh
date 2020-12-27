#!/bin/bash

#TODO make sure this is interactive?

echo "It is assumed this has been cloned from git in home/user/workspace"

echo "install docker and python"
sudo dnf install -y podman python3

echo "build ansible image"
podman build -t ansible.Dockerfile
echo "add some SELinux rules to be able to bind mount these to the container"
chcon -Rt svirt_sandbox_file_t /home/$(whoami)/.ssh/
chcon -Rt svirt_sandbox_file_t /home/$(whoami)/workspace/

#run our playbook
podman run --rm -v ~/.ssh:/root/.ssh:ro -v ${PWD}:/work -it localhost/ansible:latest ansible-playbooks -K -i hosts install.yml

echo "don't forget to generate and add a new ssh pubkey on git!"
