#IAM Role for EC2
resource "aws_iam_role" "iam_role" {
    name = "${var.team}-iam-${var.tag}-${var.app}-${var.env}-role"
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
    tags = {
        Team = var.team
    }
}

# IAM policy for EC2 role
resource "aws_iam_role_policy" "app-policy" {
    role = aws_iam_role.iam_role.id
    name = "${var.team}-iam-${var.tag}-${var.app}-${var.env}-policy"

    policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [{
            "Sid": "VisualEditor4",
            "Effect": "Allow",
            "Action": "opsworks-cm:*",
            "Resource": "*"
        },
        {
            "Sid": "cloudwatchloggroup",
            "Action": [
                "logs:CreateLogDelivery",
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:DescribeLogStreams"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:logs:*:*:*"
            ]
        },
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "sts:DecodeAuthorizationMessage",
                "sts:GetAccessKeyInfo",
                "sts:GetCallerIdentity"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "sts:*",
            "Resource": "*"
        }
        ]
    }
    EOF
}

resource "aws_iam_instance_profile" "instance_profile" {
    name = "${var.team}-iam-${var.tag}-${var.app}-${var.env}-instance_profile"
    role = aws_iam_role.iam_role.name
}