data "aws_ami" "busybox" {
  filter {
    name   = "name"
    values = ["busybox"]
  }
}

output "ami" {
  value = "%{if data.aws_ami.busybox.name == "busybox"} This is a busybox image %{else} This is not busybox image %{endif}"
}