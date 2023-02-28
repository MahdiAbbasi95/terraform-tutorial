variable "list" {
  type = list(object({
    interface = string
    ip        = string
  }))
  description = "A sample list of intefaces with their IP addresses"
}