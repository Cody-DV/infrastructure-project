
resource "aws_instance" "redis-example" {
  ami           = "ami-05bf83cf172eb63f1"
  instance_type = "t2.micro"
  key_name      = "default"
  tags = {
    application = "Redis Example"
    environment = "dev"
  }
}

