resource "aws_efs_file_system" "positive3" {
  creation_token = "my-product"

  tags = {
    Name = "MyProduct"
  }

  ebs_block_device {
    device_name = "/dev/xvda1"
    encrypted = false
  }
}
