# https://developer.hashicorp.com/terraform/language/providers



provider "aws" {
  region = "us-east-2"

}

provider "aws" {
  region = "eu-west-1"
  alias  = "ireland"
}


resource "aws_vpc" "usavpc" {
  cidr_block = "10.0.0.0/16"

}

resource "aws_vpc" "irelandvpc" {
  cidr_block = "15.0.0.0/16"
  #here we can mention particular provider alias that we created above
  provider = aws.ireland

}
