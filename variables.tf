variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "name" {
  description = "Identifier for the chammanganti.dev resources"
  type        = string
  default     = "chammanganti_dev"
}

variable "index_html_path" {
  description = "Path to the index.html file"
  type        = string
  default     = "objects/index.html"
}

variable "error_html_path" {
  description = "Path to the error.html file"
  type        = string
  default     = "objects/error.html"
}

variable "style_css_path" {
  description = "Path to the style.css file"
  type        = string
  default     = "objects/style.css"
}

variable "favicon_ico_path" {
  description = "Path to the favicon.ico file"
  type        = string
  default     = "objects/favicon.ico"
}
