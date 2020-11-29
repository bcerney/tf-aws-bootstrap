resource "aws_s3_bucket" "tf_state_bucket" {
    bucket = "${var.org_name}-tf-state-backend"
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
    object_lock_configuration {
        object_lock_enabled = "Enabled"
    }
    tags = {
        Name = "${var.org_name} S3 Remote Terraform State Store"
    }
}
