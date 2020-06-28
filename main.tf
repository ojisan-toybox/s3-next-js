provider "aws" {
  # 事前にAWS CLIで作ってる.
  profile = "s3-adder"
}

resource "aws_s3_bucket" "main" {
  bucket = "s3-nextjs-deploy"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.main.id
  policy = data.aws_iam_policy_document.bucket_policy_document.json
}

data "aws_iam_policy_document" "bucket_policy_document" {
  statement {
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    resources = [
      "${aws_s3_bucket.main.arn}",
      "${aws_s3_bucket.main.arn}/*"
    ]
    actions = ["s3:GetObject"]
  }
}

