provider "aws" {
  region = "us-east-2"

}

resource "aws_instance" "mydbserver" {
  ami             = "ami-00874d747dde814fa"
  user_data       = file()
  instance_type   = "t2.micro"
  security_groups = ["aws_security_group.mysecuritygroup.name"]

}

resource "aws_security_group" "mysecuritygroup" {

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

}

resource "aws_eip" "myfixip" {
  instance = aws_instance.mydbserver

}
