resource "aws_key_pair" "key_pair_1" {
  key_name   = "tuana9370a"
  public_key = file("~/.ssh/id_rsa.pub")
}