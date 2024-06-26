variable "ami" {
  description = "AMI to use for the Bastion host"
  type        = string
}

variable "instance_type" {
  description = "Instance type to use for the Bastion host"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID to launch the Bastion host in"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access to the Bastion host"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the Bastion host"
  type        = string
}

