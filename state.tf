terraform {
  backend "s3" {
    bucket = "terraform-devopss"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
