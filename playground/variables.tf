variable "env" {
  description = "Environment Name"
  type        = string
  sensitive   = false
  default     = "testing"
  validation {
    condition     = contains(["production", "staging", "demo", "testing", "playground"], var.env)
    error_message = "The \"env\" value should be in [\"production\", \"staging\", \"demo\", \"testing\"]"
  }
}

variable "instance_ami" {
  description = "AWS EC2 AMI ID"
  type        = string
  sensitive   = false
  validation {
    condition     = can(regex("^ami-", var.instance_ami))
    error_message = "The \"instance_ami\" value must be a valid AMI id, starting with 'ami-'."
  }
}

variable "instance_type" {
  description = "AWS EC2 Instance Type"
  type        = map(any)
  default = {
    "production" = "t3.micro"
    "staging"    = "t2.micro"
    "demo"       = "t2.micro"
    "testing"    = "t2.micro"
    "playground" = "t2.micro"
  }
  sensitive = false
}

variable "instance_monitoring" {
  description = "AWS EC2 Instance Monitoring"
  type        = bool
  default     = false
}

variable "webserver_count" {
  description = "A number of web servers"
  type        = number
  default     = 1
}

variable "database_servers" {
  description = "A set of database servers"
  type        = set(any)
  default     = ["playground-db-01", "playground-db-02"]
}