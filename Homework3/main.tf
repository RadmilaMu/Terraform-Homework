provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] 
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] 
}

resource "aws_instance" "web1" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  availability_zone = "us-east-2a"
  subnet_id = "subnet-0fb3f554e5aab86e8"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-1"
  }
}

output "web1" {
  value     = aws_instance.web1.public_ip
  sensitive = true
}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  availability_zone = "us-east-2b"
  subnet_id = "subnet-04d876ab6b5beee12"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-2"
  }
}

output "web2" {
  value     = aws_instance.web2.public_ip
  sensitive = true
}


resource "aws_instance" "web3" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  availability_zone = "us-east-2c"
  subnet_id = "subnet-0b4380071f59a639f"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-2"
  }
}


output "web3" {
  value     = aws_instance.web3.public_ip
  sensitive = true
}