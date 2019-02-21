module "create_bucket" {
  source = "modules/aws_s3_bucket"

  bucket_name = "${var.bucket_name}"
  error_page  = "${var.error_page}"
  index_page  = "${var.index_page}"
}

resource "null_resource" "upload_directory" {
  provisioner "local-exec" {
    command = "aws s3 sync $SOURCE_DIR s3://$WEBSITE_BUCKET --region $BUCKET_REGION"

    environment {
      SOURCE_DIR     = "${var.website_source}"
      WEBSITE_BUCKET = "${var.bucket_name}"
      BUCKET_REGION  = "${module.create_bucket.get_region}"
    }
  }
}
