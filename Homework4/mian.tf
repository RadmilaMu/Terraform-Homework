provider aws {
    region = var.region 
  
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "hm4" {
  ami           = var.AMI_Id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = var.instance_name
  }
}

output "hm4" {
  value     = aws_instance.hm4.public_ip
  sensitive = true
}



