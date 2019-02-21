resource "aws_s3_bucket" "create_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"

  website {
    index_document = "${var.index_page}"
    error_document = "${var.error_page}"
  }

  cors_rule {
    allowed_headers = [
      "*",
    ]

    allowed_methods = [
      "PUT",
      "POST",
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
