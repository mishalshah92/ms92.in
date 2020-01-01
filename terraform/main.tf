resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  website {
    index_document = var.index_page
    error_document = var.error_page
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
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
      "http://${var.bucket_name}",
      "https://${var.bucket_name}"
    ]
    expose_headers  = [
      "ETag",
    ]
    max_age_seconds = 3000
  }

  tags = var.tags
}

resource "null_resource" "upload_directory" {
  provisioner "local-exec" {
    command = "aws s3 sync $SOURCE_DIR s3://$WEBSITE_BUCKET --region $BUCKET_REGION --acl public-read"

    environment = {
      SOURCE_DIR     = "website/"
      WEBSITE_BUCKET = var.bucket_name
      BUCKET_REGION  = aws_s3_bucket.static_website_bucket.region
    }
  }
}