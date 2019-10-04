
resource "aws_instance" "generator" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name      = "default"
  tags = {
    application = "generator"
    environment = "dev"
  }
}