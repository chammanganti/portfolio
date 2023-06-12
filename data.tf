data "aws_iam_policy_document" "allow_access_from_cloudfront" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    effect = "Allow"

    actions = ["s3:GetObject"]

    resources = ["${aws_s3_bucket.this.arn}/*"]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = ["${aws_cloudfront_distribution.this.arn}"]
    }
  }
}

data "aws_acm_certificate" "this" {
  provider = aws.us_east_1
  domain   = "chammanganti.dev"
  statuses = ["ISSUED"]
}

data "aws_route53_zone" "selected" {
  name = "chammanganti.dev"
}
