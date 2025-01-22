provider aws {
    region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "Bastion kye"
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

  owners = ["137112412989"] # Canonical
}


resource "aws_instance" "web-1" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  subnet_id = "subnet-03eaa35ed469b4313"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")


  tags = {
    Name = "web-1"
  }
}

resource "aws_instance" "web-2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  subnet_id = "subnet-0c5778dffa913ac3c"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")


  tags = {
    Name = "web-2"
  }
}

resource "aws_instance" "web-3" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  availability_zone = "us-east-1c"
  subnet_id = "subnet-0cc0d701ff0dfe31c"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")


  tags = {
    Name = "web-2"
  }
}

