data "aws_ami" "busybox" {
  filter {
    name   = "name"
    values = ["busybox"]
  }
}

resource "aws_instance" "ec2" {
  for_each = toset(var.ec2_instances)

  ami           = data.aws_ami.busybox.id
  instance_type = var.instance_type

  tags = {
    "Name" = each.key
  }
}