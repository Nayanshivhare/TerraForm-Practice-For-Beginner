#Spin-up ec2 instance
#create security groups
#ami are region specific so my ami may not work for you.

provider "aws" {
  region = "us-east-2"

}

variable "ingressrules" {
  type    = list(number)
  default = [80, 443]

}

#we are using varible created above.
#iterator will is what youy want to iterate
# for_each= var.ingressrules- it indicates each value will be iterated
resource "aws_security_group" "mysecuritygroup" {
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0", "10.0.0.0/16"]






    }

  }

}
resource "aws_instance" "myinstance" {
  ami             = "ami-00874d747dde814fa"
  instance_type   = "t2.micro"
  security_groups = ["aws_security_group.mysecuritygroup.name"]

}

