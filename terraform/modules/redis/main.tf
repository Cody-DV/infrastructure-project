
resource "aws_instance" "redis-example" {
  ami           = "ami-05bf83cf172eb63f1"
  instance_type = "t2.micro"
  tags = {
    application = "Redis Example"
    environment = "dev"
  }
}

