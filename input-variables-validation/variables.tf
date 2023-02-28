variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"

  validation {
    condition     = substr(var.instance_type, 0, 2) == "t2"
    error_message = "You should choose a t2 tier"
  }
}

variable "environment" {
  type        = string
  description = "Environment"
}