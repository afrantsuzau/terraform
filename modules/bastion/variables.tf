variable "environment" {
}

variable "vpc_id" {
}

variable "bastion_instance_type" {
  default = "t3.micro"
}

variable "bastion_ingress" {
}

variable "bastion_kms_key_name" {
}

variable "bastion_private_key_pem" {
}
