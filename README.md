# eks-terraform

Terraform creates a VPC, EKS cluster, managed node group, ECR repository, and Argo CD bootstrap release. The root Argo CD Application points at `eks-helm`.

## Configure

Edit `envs/dev/terraform.tfvars`:
- `region`, `cluster_name`
- `helm_repo_url` — HTTPS or SSH URL of your `eks-helm` repository
- `helm_repo_path` — path inside that repository, normally `bootstrap`
- `helm_repo_target_revision` — normally `main`

Private Git repositories require Argo CD repository credentials to be configured securely after bootstrap (or injected using an approved secret-management process). This starter assumes the Helm repo is public/readable by Argo CD.

## Run

```bash
cd envs/dev
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

The Terraform state is local in this workshop starter. Configure a remote S3 backend and locking before team use. `destroy` deletes the cluster and related resources and may not delete all externally created resources.
