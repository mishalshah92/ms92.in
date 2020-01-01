variable "bucket_name" {
  type = string
  default = "www.ms92.in"
}

variable "index_page" {
  type    = string
  default = "index.html"
}

variable "error_page" {
  type    = string
  default = "error.html"
}

variable "tags" {
  type = map(string)
  default = {
    owner = "mishalshah92"
  }
}