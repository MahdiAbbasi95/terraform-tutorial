output "uppercase_list" {
  value = [for item in var.list : upper(item)]
}

output "uppercase_list_with_key" {
  value = [for key, value in var.list : "${key} is ${value}"]
}

output "uppercase_object" {
  value = { for item in var.list : item => upper(item) }
}

output "uppercase_object_with_condition" {
  value = { for item in var.list : item => upper(item) if item != "string2" }
}