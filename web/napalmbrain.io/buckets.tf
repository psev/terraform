resource "aws_s3_bucket_policy" "napalmbrain-io" {
  bucket = "${aws_s3_bucket.napalmbrain-io.bucket}"
  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
	   "Sid":"PublicReadGetObject",
      "Effect":"Allow",
	    "Principal": "*",
      "Action":[
        "s3:GetObject"
      ],
      "Resource":[
        "${aws_s3_bucket.napalmbrain-io.arn}",
        "${aws_s3_bucket.napalmbrain-io.arn}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "napalmbrain-io" {
  bucket = "napalmbrain.io"
  acl = "public-read"
  region = "${var.region}"

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
