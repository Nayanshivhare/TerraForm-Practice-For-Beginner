# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

# spin-up ec2 instance
#ami are region specific so my ami may not work for you.

provider "aws" {
  region = "us-east-2"

}

resource "aws_instance" "myinstance" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.micro"

}
resource "aws_eip" "elasticip" {
  instance = aws_instance.myinstance.id

}
