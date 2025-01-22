provider aws {
    region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "Bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Amazon Linux 2
}

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}

resource "aws_instance" "web" {
  ami = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
#availability_zone = "us-east-2a"
subnet_id = "subnet-0a8b6fd2a0aa68bbc"
key_name = aws_key_pair.deployer.key_name
vpc_security_group_ids = [aws_security_group.allow_tls.id]
user_data = file("apache.sh")
  tags = {
    Name = "web"
  }
}

resource "aws_instance" "web2" {
  ami = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
#availability_zone = "us-east-2b"
subnet_id = "subnet-09f460e967f9237ac"
key_name = aws_key_pair.deployer.key_name
vpc_security_group_ids = [aws_security_group.allow_tls.id]
user_data = file("apache.sh")
  tags = {
    Name = "web2"
  }
}
resource "aws_instance" "web3" {
 ami = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
#availability_zone = "us-east-2c"
subnet_id = "subnet-01f71df8d6a7bcd26"
key_name = aws_key_pair.deployer.key_name
vpc_security_group_ids = [aws_security_group.allow_tls.id]
user_data = file("apache.sh")
  tags = {
    Name = "web3"
  }
}

output ec2a {
    value = aws_instance.web.public_ip
}

output ec2b {
    value = aws_instance.web2.public_ip
}
output ec2c {
    value = aws_instance.web3.public_ip
}
