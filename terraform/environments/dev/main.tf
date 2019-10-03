provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "example" {
  source = "../../modules/generator-app"
}
