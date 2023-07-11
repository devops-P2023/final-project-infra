
# Input Variables
/* variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
} */

/* variable "vpc_id" {
  description = "VPC Identification"
  type        = string
  # default = "vpc-04c85e46df9e64bec"  # opcional ...
}
 */
/* variable "subnets" {
  description = "Subnets"
  type        = list(string)
  default     = []
}

variable "role_arn" {
  description = "Role ARN"
  type        = string
  default     = "arn:aws:iam::806379772007:role/LabRole"
} */

variable "role_arn" {
  description = "Role ARN"
  type        = string
  default     = "arn:aws:iam::613707607690:role/LabRole"
}
