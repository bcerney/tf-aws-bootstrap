resource "aws_dynamodb_table" "terraform-lock" {
    name           = "${var.org_name}_tf_state"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "${var.org_name} DynamoDB Terraform State Lock Table"
    }
}