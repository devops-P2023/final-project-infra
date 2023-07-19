#Works
# Resource Block: Create Random Pet Name 
/* resource "random_pet" "petname" {
  length    = 5
  separator = "-"
} */

# Resource Block: Create AWS S3 Bucket
resource "aws_s3_bucket" "origin" {
  bucket        = "directly-conversely-lively-tidy-finch"
  #force_destroy = var.origin_s3_force_destroy
  #depends_on    = [aws_s3_bucket.logs]

  /* provisioner "local-exec" {
    when        = destroy
    command     = "../../scripts/destroy-resources/remove_s3_content.sh"
    interpreter = ["sh"]
    working_dir = path.module
    environment = {
      BUCKET_ID = self.id
    }
  } */
}

resource "aws_s3_bucket_website_configuration" "origin" {
  bucket = aws_s3_bucket.origin.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404/index.html"
  }

  routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "/"
    },
    "Redirect": {
        "HttpRedirectCode": "302",
        "ReplaceKeyPrefixWith": "en-us"
    }
}]
EOF
}

resource "aws_s3_bucket_ownership_controls" "origin" {
  bucket = aws_s3_bucket.origin.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket_public_access_block.origin]
}

resource "aws_s3_bucket_public_access_block" "origin" {
  bucket = aws_s3_bucket.origin.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "time_sleep" "wait_60_seconds" {

  create_duration = "60s"
}

resource "aws_s3_bucket_acl" "origin" {
  bucket     = aws_s3_bucket.origin.id
  acl        = "public-read"

  depends_on = [time_sleep.wait_60_seconds]
}


resource "aws_s3_bucket_policy" "origin" {
  bucket = aws_s3_bucket.origin.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::directly-conversely-lively-tidy-finch/*"
            ]
        }
    ]
}
POLICY

depends_on = [aws_s3_bucket_acl.origin]
}