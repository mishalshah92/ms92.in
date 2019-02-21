variable "bucket_name" {
  type = "string"
}

variable "index_page" {
  type    = "string"
  default = "index.html"
}

variable "error_page" {
  type    = "string"
  default = "error.html"
}

variable "tags" {
  type    = "map"
  default = {}
}
