#

provider "aws" {
  region = "us-east-2"

}

module "ec2names" {
  source = "./ec2"
  # we have mentioned multiple names
  servername = ["nayan", "nmo", "aman", "shawn"]

}

# we have given output from output that we created in our resource files.
# allname it the name of that file.
output "ipaddress" {
  value = module.ec2names.allnames

}
