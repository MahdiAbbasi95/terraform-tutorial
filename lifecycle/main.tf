data "aws_ami" "busybox" {
  filter {
    name   = "name"
    values = ["busybox"]
  }
}

data "aws_ami" "ubuntu" {
  filter {
    name   = "name"
    values = ["ubuntu"]
  }
}

resource "aws_instance" "ec2_1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    "Name" = "first-ec2-${var.environment}"
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.busybox.id
  instance_type = var.instance_type

  tags = {
    "Name" = "ec2-${var.environment}"
  }

  lifecycle {
    # create_before_destroy = true
    # prevent_destroy = true
    # ignore_changes = [
    #   tags
    # ]
    # replace_triggered_by = [
    #   aws_instance.ec2_1.id
    # ]
    # precondition {
    #   condition = data.aws_ami.busybox.id == "ami-000001"
    #   error_message = "This image is not busybox, For this instance only busybox will be accepted."
    # }
  }
}