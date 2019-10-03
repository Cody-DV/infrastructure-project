
resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  tags = {
    application = "example-app"
    environment = "dev"
  }
}