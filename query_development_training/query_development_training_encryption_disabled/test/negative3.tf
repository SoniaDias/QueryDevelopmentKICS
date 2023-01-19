resource "aws_ebs_volume" "negative3" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name = "HelloWorld"
  }

  encrypted = true
}
