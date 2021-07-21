data "aws_caller_identity" "current" {}

data "aws_ami" "amazon2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-minimal-hvm-*"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.amazon2.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2 Demo Instance"
  }
}
