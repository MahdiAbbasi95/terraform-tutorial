data "aws_ami" "busybox" {
  filter {
    name   = "name"
    values = ["busybox"]
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.busybox.id
  instance_type = var.instance_type

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ip.txt"
  }

  provisioner "local-exec" {
    command = "echo Provisioner in Destroy time > destroy_time.txt"
    when    = destroy
  }

  provisioner "local-exec" {
    command    = "test 'test1' = 'test2'"
    on_failure = fail # fail or continue
  }

  tags = {
    "Name" = "ec2-${var.environment}"
  }
}