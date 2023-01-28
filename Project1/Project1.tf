provider "aws" {
  region = "us-east-2"

}

resource "aws_instance" "mydbserver" {
  ami             = "ami-0ab0629dba5ae551d"
  user_data       = file("nm.sh")
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.mysecuritygroup.name]

}

resource "aws_security_group" "mysecuritygroup" {

  ingress {
    from_port   = 80
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_eip" "myfixip" {
  instance = aws_instance.mydbserver.id

}

output "eip" {
  value = aws_eip.myfixip.public_ip

}

