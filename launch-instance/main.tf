provider "aws" {
  region  = "ap-northeast-1"
  profile = "terraform"

}

data "aws_subnet" "example" {
  filter {
    name   = "tag:Name"
    values = ["ltec-dev-lwh-subnet-pub1a"]
  }
}

resource "aws_instance" "terraform" {
  ami           = "ami-0ca38c7440de1749a"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.example.id
  tags = {
    Name = "ExampleInstance"
  }
}
