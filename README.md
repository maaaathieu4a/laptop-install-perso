Some basic ansible playbooks to deploy my laptop.
Doubles as a dotfiles repo

Pre-requisites : 
- a fedora installation
- a working network connection and git to clone this repository





#Intended way of working
Any intended change should be done within playbooks here and then applied
The playbooks setup a shortcut to apply changes

#Technicalities
it's all hidden under the rug in install.sh and update.sh, 
ansible runs from a container


#ROADMAP
TODO : actually test this
TODO : how to configure wifi, need a dialogue to ask for password
TODO : use a Makefile for fun : runs the pre-requisite stuff with sudo then runs the playbook
