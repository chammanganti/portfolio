resource "aws_s3_bucket" "this" {
  bucket = "chammanganti-dev"

  tags = {
    Name = var.name
  }
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "index.html"
  source       = "${path.module}/${var.index_html_path}"
  content_type = "text/html"

  etag = filemd5("${path.module}/${var.index_html_path}")
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "error.html"
  source       = "${path.module}/${var.error_html_path}"
  content_type = "text/html"

  etag = filemd5("${path.module}/${var.error_html_path}")
}

resource "aws_s3_object" "style" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "style.css"
  source       = "${path.module}/${var.style_css_path}"
  content_type = "text/css"

  etag = filemd5("${path.module}/${var.error_html_path}")
}

resource "aws_s3_object" "favicon" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "favicon.ico"
  source       = "${path.module}/${var.favicon_ico_path}"
  content_type = "image/x-icon"

  etag = filemd5("${path.module}/${var.favicon_ico_path}")
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.allow_access_from_cloudfront.json
}
