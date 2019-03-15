output "website_endpoint" {
  value = "${module.create_bucket.get_website_endpoint}"
}

output "website_domain" {
  value = "${module.create_bucket.get_website_domain}"
}
