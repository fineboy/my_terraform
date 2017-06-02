resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  availability_zone = "eu-west-1a"
  instance_type = "t2.micro"
  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
   tags {
        Name = "innocent-terraform"
    }
  tags {
   tag = "okezie"
   Name = "aboki"
  }
}
resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "eu-west-1a"
    size = 8
    type = "gp2"
    tags {
        Name = "extra volume data"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.example.id}"
}

