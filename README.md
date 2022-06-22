# Terraform IaC Playground

## Terraform variables definition precedence

 1. Through env variables: 

    export TF_VAR_ami="ami-0d71ea30463e0ff8d" TF_VAR_instance_type="t3.micro"
    terraform plan

 2. Automatically loading from files `terraform.tfvars` or `*.auto.tfvars` 

 3. Through command line args passing vars or var file name: 

    terraform plan -var "instance_type=t3.micro" -var "ami=ami-0d71ea30463e0ff8d"
    terraform plan -var-file playground.tfvars

 