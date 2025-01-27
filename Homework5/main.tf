provider aws {
    region = var.region
}

variable region {
  default = ""
  type = string
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
  Team = "DevOps"
  Environment = "Dev"
  Owner = "Bektur"

  }
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data = file("apache.sh")

}

variable instance_type {
  default = ""
}

  output ec2 {
    value = aws_instance.web.public_ip

}

