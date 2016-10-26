resource "aws_iam_role" "ec2" {
  name = "${var.identifier}-${var.region}-${var.deploy}-${var.role}-ec2"
  path = "/instance/"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "ec2" {
  name = "${var.identifier}-${var.region}-${var.deploy}-${var.role}-ec2"
  path = "/instance/"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:DescribeInstances"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "ec2" {
  name = "${var.identifier}-${var.region}-${var.deploy}-${var.role}-ec2"
  roles = [ "${aws_iam_role.ec2.name}" ]
  policy_arn = "${aws_iam_policy.ec2.arn}"
}

resource "aws_iam_instance_profile" "ec2" {
  name = "${var.identifier}-${var.region}-${var.deploy}-${var.role}-ec2"
  path = "/instance/"
  roles = [ "${aws_iam_role.ec2.name}" ]
}
