output "string_templates_for" {
  value = "%{for ip in var.ip_list}${ip}\n%{endfor}"
}