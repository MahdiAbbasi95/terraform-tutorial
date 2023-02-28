data "aws_ami" "ami" {
  filter {
    name   = "name"
    values = [var.ami_name]
  }

  lifecycle {
    postcondition {
      condition     = self.name == "busybox"
      error_message = "The AMI name should be busybox"
    }
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type

  tags = {
    "Name" = "ec2"
  }
}