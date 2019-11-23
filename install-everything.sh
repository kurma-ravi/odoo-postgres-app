#!/bin/bash
#
# INSTALL EVERYTHING!!
# You can look through this file to hand-pick what to
# install on a new server as well.
##################################

# Installing Ansible
apt install ansible -y

# Copy our customized hosts file to ansible directory
sudo cp /apps/odoo-postgres-app/hosts /etc/ansible/

# This play book install docker & docker-compose on the VM or Cloud Instance
ansible-playbook /apps/odoo-postgres-app/docker-install-playbook.yml

# This docker-compose file will SETUP, CREATE & RUN 3 Odoo & 2 Postgres containers
docker-compose -f /apps/odoo-postgres-app/odoo-postgress-setup/docker-compose.yml up -d

# Install nginx & setup reverse-proxy
ansible-playbook /apps/odoo-postgres-app/nginx-reverse-proxy-playbook.yml