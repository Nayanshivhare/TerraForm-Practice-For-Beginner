#Spin-up ec2 instance
#create security groups
#ami are region specific so my ami may not work for you.

provider "aws" {
  region = "us-east-2"

}



resource "aws_security_group" "mysecuritygroup" {
  dynamic "ingress" {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0", "10.0.0.0/16"]
  }

}
resource "aws_instance" "myinstance" {
  ami             = "ami-00874d747dde814fa"
  instance_type   = "t2.micro"
  security_groups = ["aws_security_group.mysecuritygroup.name"]

}

