variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "ec2_instances" {
  type        = map(string)
  description = "EC2 Instances Tags"
}