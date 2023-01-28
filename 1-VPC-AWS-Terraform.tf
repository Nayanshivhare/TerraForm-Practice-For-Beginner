#Create aws vpc
# assign cidr range - 192.168.2.0/24

provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.2.0/24"

}
