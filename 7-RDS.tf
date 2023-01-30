#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance

provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "mydbinstance" {
  allocated_storage    = 10
  db_name              = "mydbbackend"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "Nayan@9424"
  parameter_group_name = "default.mysql5.7"
  security_groups      = ["aws_security_group.mydbsecuritygroup.name"]
  skip_final_snapshot  = true


}

resource "aws_security_group" "mydbsecuritygroup" {

  ingress = [{
    cidr_blocks = ["198.0.0.0/24"]
    description = "mysecuritygroupforrds"
    from_port   = 1
    protocol    = "tcp"
    to_port     = 4000
  }]





}

