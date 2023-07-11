#Works
/* # Resource Block: Create Random Pet Name 
resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

# Resource Block: Create AWS S3 Bucket
resource "aws_s3_bucket" "frontend" {
  bucket = random_pet.petname.id
  #acl    = "public-read"
  #region = "us-east-1"  # Comment this if we are going to use AWS Provider v3.x version
}
 */
#=========


#acl    = "public-read"

#Si no comento el acl below error:

/* Warning: Argument is deprecated
│ 
│   with aws_s3_bucket.sample,
│   on c2-s3bucket.tf line 10, in resource "aws_s3_bucket" "sample":
│   10:   acl    = "public-read"
│ 
│ Use the aws_s3_bucket_acl resource instead
╵
╷
│ Error: updating S3 Bucket (equally-reasonably-easily-loyal-cougar) ACL: AccessDenied: Access Denied
│       status code: 403, request id: SACGF7YVVFMZ3MAB, host id: rD+R09Aom6sSPQRhFKw4cGhh3a2sgz0IQ6DnFZFDkAfL9i05i54n14D95RJrmja9HVePIkLlqDE=
│ 
│   with aws_s3_bucket.sample,
│   on c2-s3bucket.tf line 8, in resource "aws_s3_bucket" "sample":
│    8: resource "aws_s3_bucket" "sample" {
│  */