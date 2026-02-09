provider "aws" {
  region = "us-east-1"
}

variable "instance_names" {
  default = [
    "jenkins",
    "tomcat-1",
    "tomcat-2",
    "Monitoring server"
  ]
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t2.micro"
  key_name               = "aws-devops-key"
  vpc_security_group_ids = ["sg-065591c7faf920d78"]

  tags = {
    Name = var.instance_names[count.index]
  }
}
