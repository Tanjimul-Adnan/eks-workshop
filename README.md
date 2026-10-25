# Terraform code 

<<<<<<< HEAD
<<<<<<< HEAD
## Maintain vpc & eks with terraform for vprofile project
=======
Creates a VPC with public/private subnets, Internet Gateway, public/private route tables, a single NAT Gateway, EKS private worker nodes, four Dockerhub repositories, and Argo CD.
>>>>>>> 9275ccfcc144d1ba20471b4c56fd05b33833fee2
=======
## Maintain vpc & eks with terraform for vprofile project
>>>>>>> staging

## Tools required
Terraform version 1.6.3

### Steps
* terraform init
* terraform fmt -check
* terraform validate
* terraform plan -out planfile
* terraform apply -auto-approve -input=false -parallelism=1 planfile
####
#####
