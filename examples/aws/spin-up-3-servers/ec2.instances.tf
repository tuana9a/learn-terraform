resource "aws_instance" "instance_group_1" {
  for_each = toset(["1", "2", "3"])

  instance_type = "t2.micro"
  ami           = data.aws_ami.ubuntu_server.id
  key_name      = aws_key_pair.key_pair_1.id
  subnet_id     = aws_subnet.subnet_1.id
  vpc_security_group_ids = [
    aws_security_group.sg_1.id
  ]

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }
}

resource "aws_eip" "eip_group_1" {
  for_each = aws_instance.instance_group_1

  vpc      = true
  instance = each.value.id

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ip.local.txt"
  }
}