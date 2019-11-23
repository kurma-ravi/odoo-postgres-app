
sudo su -
cd /
mkdir -p /apps/odoo-postgres-app
chmod 777 /apps/odoo-postgres-app
cd /apps/odoo-postgres-app
apt-get update -y
apt install git -y
apps/odoo>git clone ssh://git@onestash.verizon.com:7999/frve/reltar-aws.git /apps/odoo-postgres-app
---------------------------

3. apt install ansible -y
4. write a ansible playbook to install docker & docker-compose "/etc/ansible/"
	>ansible-playbook docker-install-playbook.yml
5. Setup odoo application & postgress database.
	cd /apps/odoo-postgres-app/odoo-postgress-setup
	>docker-compose up -d
6. Install nginx & setup reverse-proxy
	cd /odoo-postgres-app/
	>ansible-playbook nginx-reverse-proxy-playbook.yml
