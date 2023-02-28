variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "ami_name" {
  type        = string
  description = "AMI Name"
  default     = "busybox"
}