variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "security_groups_list" {
  type = list(object({
    port     = number
    protocol = string
  }))
}