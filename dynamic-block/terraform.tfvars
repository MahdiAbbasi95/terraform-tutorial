instance_type = "t2.micro"
environment   = "dev"
security_groups_list = [{
  port     = 443
  protocol = "tcp"
  },
  {
    port     = 80
    protocol = "tcp"
}]