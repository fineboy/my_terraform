resource "aws_instance" "example" {
  ami           = "ami-01ccc867"
  instance_type = "t2.micro"
  tags {
   tag = "okezie"
  }
}
