variable "cluster_name" {
}

variable "nodes_name" {
}

variable "nodes_capacity_type" {
}

variable "nodes_disk_size" {
  default = 32
}

variable "ami_type" {
  default = "AL2_x86_64"
}

variable "force_update_version" {
  type    = bool
  default = false
}

variable "nodes_instance_types" {
  type    = list(string)
  default = ["t2.small", "t3.small", "t3a.small"]
}

variable "asg_desired_size" {
  default = 1
}

variable "asg_max_size" {
  default = 3
}

variable "asg_min_size" {
  default = 1
}

variable "environment" {
}

variable "vpc_id" {
}

variable "vpc_subnets" {
}

variable "iam_eks_nodes_role_arn" {
}

variable "node_taint" {
  type = map(string)

  default = {
  }
}

variable "nodes_ssh_key" {
}
