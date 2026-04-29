provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-098e39bafa7e7303d"
  instance_type          = "c7i-flex.large"
  key_name               = "project-key"
  vpc_security_group_ids = ["sg-04dfda1b938b72f0e"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["ansible", "dev", "test", "Monitoring server"]
}
