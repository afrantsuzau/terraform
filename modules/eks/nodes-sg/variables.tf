variable "cluster_name" {
}

variable "environment" {
}

variable "nodes_name" {
}

variable "vpc_id" {
}

variable "nodes_sg_inbound_cidr_blocks" {
  type = list(string)
}
