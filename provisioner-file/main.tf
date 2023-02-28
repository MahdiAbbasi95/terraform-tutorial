data "aws_ami" "busybox" {
  filter {
    name   = "name"
    values = ["busybox"]
  }
}

resource "aws_key_pair" "key_pair" {
  key_name   = "my-key"
  public_key = var.public_key
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.busybox.id
  instance_type = var.instance_type

  key_name = aws_key_pair.key_pair.key_name

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = var.username
      host        = self.public_ip
      private_key = file(var.private_key)
    }

    source      = var.source_file
    destination = var.destination_file
  }

  tags = {
    "Name" = "ec2-${var.environment}"
  }
}