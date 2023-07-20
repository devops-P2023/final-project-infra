
# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
} 



variable "role_arn" {
  description = "Role ARN"
  type        = string
  default     = "arn:aws:iam::613707607690:role/LabRole"
}
