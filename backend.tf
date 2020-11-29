terraform {
  backend "s3" {
    bucket         = "bootstrap-poc-tf-state-backend"
    key            = "test/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "bootstrap-poc_tf_state"
  }
}
