data "aws_ami" "busybox" {
  filter {
    name   = "name"
    values = ["busybox"]
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.busybox.id
  instance_type = var.instance_type != "" ? var.instance_type : "t2.micro"

  tags = {
    "Name" = "ec2-${var.environment}"
  }
}