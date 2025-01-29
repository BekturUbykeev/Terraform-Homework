module "instance" {
  source  = "BekturUbykeev/instance/module"
  version = "2.0.0"
  region ="us-east-2"
  instance_name = "web"
  instance_type = "t2.micro"
 
}