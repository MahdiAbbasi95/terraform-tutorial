data "aws_ami" "busybox" {
  filter {
    name   = "name"
    values = ["busybox"]
  }
}

locals {
  written_by = "terraform"
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.busybox.id
  instance_type = var.instance_type

  tags = {
    "Name"       = "ec2-${var.environment}"
    "written_by" = local.written_by
  }
}