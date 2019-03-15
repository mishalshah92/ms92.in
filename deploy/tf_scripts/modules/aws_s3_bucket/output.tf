output "get_id" {
  value = "${aws_s3_bucket.create_bucket.id}"
}

output "get_arn" {
  value = "${aws_s3_bucket.create_bucket.arn}"
}

output "get_bucket_domain_name" {
  value = "${aws_s3_bucket.create_bucket.bucket_domain_name}"
}

output "get_bucket_regional_domain_name" {
  value = "${aws_s3_bucket.create_bucket.bucket_regional_domain_name}"
}

output "get_hosted_zone_id" {
  value = "${aws_s3_bucket.create_bucket.hosted_zone_id}"
}

output "get_region" {
  value = "${aws_s3_bucket.create_bucket.region}"
}

output "get_website_domain" {
  value = "${aws_s3_bucket.create_bucket.website_domain}"
}

output "get_website_endpoint" {
  value = "${aws_s3_bucket.create_bucket.website_endpoint}"
}
