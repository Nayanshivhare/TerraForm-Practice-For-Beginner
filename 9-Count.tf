# count will create the no of service you will specify.

provider "aws" {
  region = "us-east-2"

}

resource "aws_instance" "myinstance" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.micro"
  count         = 3

}

