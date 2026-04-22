terraform {
  backend "s3" {
    bucket = "tf-state-maharaja-123"
    key    = "terraform/eks.tfstate"
    region = "ap-south-1"
  }
}
