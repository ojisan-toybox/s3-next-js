provider "aws" {
  # 事前にAWS CLIで作ってる. 
  profile = "s3-adder"
}

resource "aws_s3_bucket" "main" {
  bucket = "s3-nextjs-deploy"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}
