Requirements: 
AWS account
AWS secrets configured under 'default' account on host machine

Build AMI:
cd packer/
packer build -var-file variables.json server.json

Build Infrastructure:
terraform plan
terraform apply

Teardown Infrastructure:
terraform destroy