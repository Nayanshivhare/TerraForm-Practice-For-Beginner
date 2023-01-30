#dependencies will create one service after other.

provider "aws" {
  region = "us-east-2"

}

resource "aws_instance" "myinstance" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.micro"

}


resource "aws_instance" "backendservice" {
  ami           = "ami-00874d747dde814fa"
  instance_type = t2.micro
  depends_on = [
    aws_instance.myinstance
  ]

}
