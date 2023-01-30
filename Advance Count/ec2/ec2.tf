variable "servername" {
  type = list(string)

}



resource "aws_instance" "myinstance" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.micro"
  count         = length(var.servername)
  tags = {
    "Name" = var.servername[count.index]
  }

}



output "allnames" {
  value = [aws_instance.myinstance.*.host_id]


}
