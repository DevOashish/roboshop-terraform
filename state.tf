terraform {
  backend "s3" {}
}


bucket = "devostate"
    key    = "rroboshop/dev/terraform.tfstate"
    region = "us-east-1"
  # }