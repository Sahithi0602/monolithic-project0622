provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-098e39bafa7e7303d"
  instance_type          = "c7i-flex.large"
  key_name               = "mono-key"
  subnet_id              = "subnet-07a447ecc46e5b739"  
  vpc_security_group_ids = ["sg-0aefa9394a5bfced9"]
  associate_public_ip_address = true
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["ansible", "dev", "test", "Monitoring server"]
}
resource "aws_s3_bucket" "demo" {
  bucket = "sahithi-monolithic-bucket-0622"
}
