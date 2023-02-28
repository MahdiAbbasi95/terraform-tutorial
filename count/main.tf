data "aws_ami" "busybox" {
  filter {
    name   = "name"
    values = ["busybox"]
  }
}

resource "aws_instance" "ec2" {
  count = 2

  ami           = data.aws_ami.busybox.id
  instance_type = var.instance_type

  tags = {
    "Name"  = "ec2-${var.environment}"
    "index" = "ec2-${count.index}"
  }
}