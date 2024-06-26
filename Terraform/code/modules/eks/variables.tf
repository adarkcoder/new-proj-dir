variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "public_subnets" {
  description = "The public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "The private subnets."
  type        = list(string)
}

variable "cluster_sg_id" {
  description = "The security group ID for the EKS cluster."
  type        = string
}

variable "node_group_sg_id" {
  description = "The security group ID for the EKS node group."
  type        = string
}
