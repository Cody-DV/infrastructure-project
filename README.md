# Infrastructure Reference Project

This project uses Packer and Ansible to build and configure an Amazon Machine Image (AMI). The AMI is running Ubuntu and using NGINX + Gunicorn to serve a Flask Hello World app.  

Terraform is used to create an AWS VPC, configure networking and security rules, launch an instance from the Packer built AMI, and expose a public IP address for the service to be accessed. 


#### Requirements: 
* AWS account
* AWS secrets configured under 'default' account on host machine

#### Build AMI:
* cd packer/
* packer build -var-file variables.json server.json

#### Build Infrastructure:
* terraform plan
* terraform apply

#### Teardown Infrastructure:
* terraform destroy