#terraform-bluegreen-tut

variable "infrastructure_version" {
	default = "2"
}

provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket = "terraform-bluegreen-tut"
    region = "us-west-2"
    key = "v2"
  }
}

# The version of the Infrastructure
# The Cloud provider we will be using (in this case, AWS)
# The Backend in which the state will be saved (in this case, S3), and the configuration attached to it.