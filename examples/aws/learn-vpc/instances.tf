resource "aws_instance" "instance_1" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.ubuntu_server.id
  subnet_id     = aws_subnet.subnet_1.id
  private_ip    = "10.0.1.11"
  key_name      = aws_key_pair.key_pair_1.id
  vpc_security_group_ids = [
    aws_vpc.vpc_1.default_security_group_id,
    aws_security_group.sg_1.id
  ]

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ip.local.txt"
  }
}

resource "aws_instance" "instance_2" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.ubuntu_server.id
  subnet_id     = aws_subnet.subnet_2.id
  private_ip    = "10.0.2.12"
  vpc_security_group_ids = [
    aws_vpc.vpc_1.default_security_group_id,
    # aws_security_group.sg_2.id
  ]

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ip.local.txt"
  }
}