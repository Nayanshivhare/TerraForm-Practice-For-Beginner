
variable "ec2instance" {
  type = string

}
resource "aws_instance" "myinstance" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2instance
  }

}

