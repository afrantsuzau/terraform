# [Terraform Associate Certification Preparation Playground](https://github.com/afratsuzau/terraform)

## [Terraform variables definition precedence](https://www.terraform.io/language/values/variables#variable-definition-precedence)

1. Through env variables: 
    ```
    export TF_VAR_ami="ami-0d71ea30463e0ff8d" TF_VAR_instance_type="t3.micro"
    terraform plan
    ```

2. Automatically loading from files `terraform.tfvars` or `*.auto.tfvars` 

3. Through command line args passing vars or var file name: 
    ```
    terraform plan -var "instance_type=t3.micro" -var "ami=ami-0d71ea30463e0ff8d"
    terraform plan -var-file playground.tfvars
    ```

## [Terraform variables validation](https://www.terraform.io/language/values/variables#custom-validation-rules)
1. 
    ```
    validation {
      condition = can(regex("^ami-", var.ami))
      error_message = "The 'ami' value must be a valid AMI id, starting with 'ami-'."
    }
    ```
2. 
    ```
    validation {
      condition = contains(["t2.micro", "t3.micro"], var.instance_type)
      error_message = "The 'instance_type' value must be a valid EC2 instance type in ['t2.micro', 't3.micro']"
    }
    ```

## [Terraform variables types](https://www.terraform.io/language/expressions/types)
* string
* number
* bool
* list
* map
* tuple
* object

## [Terraform outputs](https://www.terraform.io/language/values/outputs)
* To list all outputs use command `terraform output`
    ```
    instance_private_ip = "172.31.34.224"
    instance_public_ip = <sensitive>
    ```

* To view specific output value use command `terraform output instance_private_ip`
    ```
    instance_private_ip = "172.31.34.224"
    ```

## [Terraform resource attributes](https://www.terraform.io/language/resources)
* To display resource attributes use command `terraform show`

## [Terraform resource dependencies](https://www.terraform.io/language/meta-arguments/depends_on)
* Code sample
    ```
    depends_on = [
      aws_instance.db
    ]
    ```

## [Terraform resource targeting](https://learn.hashicorp.com/tutorials/terraform/resource-targeting)
* To apply change only for specific resource run command `terraform apply -target=random_string.random_suffix`
    ```
    Terraform will perform the following actions:

    # random_string.random_suffix must be replaced
    -/+ resource "random_string" "random_suffix" {
          ~ id          = "tv6j4p" -> (known after apply)
          ~ length      = 6 -> 8 # forces replacement
          ~ result      = "tv6j4p" -> (known after apply)
            # (9 unchanged attributes hidden)
        }

    Plan: 1 to add, 0 to change, 1 to destroy.
    ```