# retail-shop-terraform

Creates a VPC with public/private subnets, Internet Gateway, public/private route tables, a single NAT Gateway, EKS private worker nodes, four Dockerhub repositories, and Argo CD.

Copy `envs/dev/terraform.tfvars.example` to `terraform.tfvars`, update the values, then run `terraform init`, `terraform validate`, `terraform plan`, and `terraform apply`.

The Argo CD root Application is applied as a second step after Argo CD CRDs are installed; see the workspace README.
