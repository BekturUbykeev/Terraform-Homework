provider aws {
    region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-bekturu"

}

resource "aws_s3_bucket" "example2" {
  bucket = "kaizen-hello"

}
# terraform import aws_s3_bucket.example2 kaizen-hello

resource "aws_s3_bucket" "example3" {
  bucket = "kaizen-world"

}
# terraform import aws_s3_bucket.example3 kaizen-world
