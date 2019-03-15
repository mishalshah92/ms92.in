resource "aws_s3_bucket" "create_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"

  website {
    index_document = "${var.index_page}"
    error_document = "${var.error_page}"
  }

  server_side_encryption_configuration {
    rule {
      "apply_server_side_encryption_by_default" {
        sse_algorithm = "AES256"
      }
    }
  }

  cors_rule {
    allowed_headers = [
      "*",
    ]

    allowed_methods = [
      "GET",
    ]

    allowed_origins = [
      "http://${var.bucket_name}.com",
      "https://${var.bucket_name}.com",
    ]

    expose_headers = [
      "ETag",
    ]

    max_age_seconds = 3000
  }

  tags = "${var.tags}"
}
