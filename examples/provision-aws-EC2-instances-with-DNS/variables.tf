variable "aws_region" {
  type     = string
  nullable = false
}

variable "aws_profile_name" {
  type     = string
  nullable = false
}

variable "aws_credential_files" {
  type     = list(string)
  nullable = false
}

variable "aws_ec2_instance_names" {
  type     = list(string)
  nullable = false
}

variable "aws_ec2_instance_type" {
  type     = string
  nullable = false
  default  = "variable t2.micro"
}

variable "aws_key_pair_name" {
  type     = string
  nullable = false
}

variable "aws_key_pair_public_key_file" {
  type     = string
  nullable = false
}

variable "cloudflare_email" {
  type     = string
  nullable = false
}

variable "cloudflare_api_token" {
  type     = string
  nullable = false
}

variable "cloudflare_zone_id" {
  type     = string
  nullable = false
}