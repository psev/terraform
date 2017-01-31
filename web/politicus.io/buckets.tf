resource "aws_s3_bucket_policy" "politicus-io" {
  bucket = "${aws_s3_bucket.politicus-io.bucket}"
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
        "${aws_s3_bucket.politicus-io.arn}",
        "${aws_s3_bucket.politicus-io.arn}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "politicus-io" {
  bucket = "politicus.io"
  acl = "public-read"
  region = "${var.region}"

  website {
    index_document = "index.html"
    error_document = "404.html"

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
