data "aws_ami" "busybox" {
  filter {
    name   = "name"
    values = ["busybox"]
  }
}

resource "aws_security_group" "my_sg" {
  name = "my-sg"

  dynamic "ingress" {
    for_each = var.security_groups_list
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.busybox.id
  instance_type = var.instance_type

  security_groups = [aws_security_group.my_sg.name]

  tags = {
    "Name" = "ec2-${var.environment}"
  }
}