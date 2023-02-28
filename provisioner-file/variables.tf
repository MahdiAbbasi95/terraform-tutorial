variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "source_file" {
  type        = string
  description = "Source file"
}

variable "destination_file" {
  type        = string
  description = "Destination file"
}

variable "public_key" {
  type        = string
  description = "Public Key"
}

variable "private_key" {
  type        = string
  description = "Private key path"
}

variable "username" {
  type        = string
  description = "Username"
}