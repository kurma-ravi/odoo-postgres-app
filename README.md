# odoo-postgres-app

### Requirement:
Need to setup odoo application with postgres database on multiple odoo web(3 containers) and database(2 containers) with replication. Also, These web-containers has to be exposed through Nginx reverse-proxy.

### Explaination:
The developed program will fulfil the given requirement. Up on running the code/scripts on the server/Virtual Machine, it automatically creates 5 docker containers 3-odoo & 2-postgres(with replication) and Nginx server which does reverse-proxy to all the 3 odoo containers.

### Pre-requisites:
One Virtual Machine [OR] One Cloud Instance. Preferably any UBUNTU machine

### Platform:
The developed automated scripts in "github" will work on any Virtual Machine(Ubuntu)/Cloud Instance(Ubuntu).

### TOOLS Used:
	Ansible (Playbooks)
	Docker
	Docker-compose
	Nginx
	bash scripting
### Vagrant VM Setup Steps:
1. Download Vagrant & Virtualbox and install them on your local machine.
2. Create an Vagrant Box "Ubuntu/trusty64" & map it to any directory on your local machine( I used directory: C:/Vagrant/VMs/Ubuntu)
3. To make your windows local machine to connect/ssh to virtual ubuntu box, you need to perform below steps:

        3.1. Adding new network Adapter:
	       - On the Virtualbox go to "Settings => Network => Click on Adapter-2 => Select Host-Only network"
	       - Click on "Advanced" and select "Allow VMS".
        
        3.2  Now, restart your Virtual ubuntu box.
     	
        3.3 Login to virtual ubuntu box and goto "/etc/network/interfaces/" and change the file to the address to your base IP  address, as below:
	
			auto eth1
			iface eth1 inet static
			address 192.168.56.101
			netmask 255.255.255.0
        
        3.4 Restart your ubuntu box & Start ubuntu box from virtualbox
	
4. Now, Open command prompt on your windows local machine and run below commands:

		C:\Vagrant\VMs\ubuntu>vagrant ssh
5. This will connect to your ubuntu box from your windows machine with Static IP in your window ip-network.

## Odoo Application Setup Steps:
1. Login to your Virtual Machine/Cloud Instance.
     
     	1.1. Vagrant Box login Credentials, if logging in with Virtual box:   root/vagrant
     
     	1.2. Vagrant Box commandline login, if logging in using localmachine Command prompt:   vagrant ssh

2. Once, you login to the Virtual Machine, RUN the below commands on the terminal of the server to do the INITIAL-SETUP:

		sudo su -
		apt-get update -y
		apt install git -y
		cd /
		sudo mkdir -p /apps/odoo-postgres-app
		chmod 777 /apps/odoo-postgres-app
		cd /apps/odoo-postgres-app
		git clone https://github.com/kurma-ravi/odoo-postgres-app.git /apps/odoo-postgres-app
		chmod 777 /apps/odoo-postgres-app/*

3. RUN the below command(s) on the terminal of the server, to LAUNCH the odoo applicaton as per the requirement.
	
		cd /apps/odoo-postgres-app
		./install-everything.sh       / * This is the DRIVER script which triggers all other scripts */
4. Finally, LAUNCH any web browser(IE, Chrome, Firefox etc) with VirtualMachine IP address(REVERSE-PROXY: without portno: in the url) as url below.
	
		http://<VirtualMachine IP Address>
		example: http://192.168.56.101

###### NOTE: Make sure, your docker network gateway is same nginx conf files. 

## Script/Code file definitions:
1. The below Playbook(YAML) will install docker and docker-compose on the server.
         	
		docker-install-playbook.yml
2. The below docker-compose file will create 3-odoo & 2-postgress containers with postgress one as main and the other as stand-by
		
		docker-compose.yml
3. This Playbook will install NGINX and also do the configuration for REVERSE-PROXY by enabling the our customized configuration files.
	
		nginx-reverse-proxy-playbook.yml
		
		Config Files:
			ngnx-reverse-proxy-conf-files/odoo-app-1.conf
			ngnx-reverse-proxy-conf-files/odoo-app-2.conf
			ngnx-reverse-proxy-conf-files/odoo-app-3.conf
		
