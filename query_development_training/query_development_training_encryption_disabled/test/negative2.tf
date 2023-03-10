resource "aws_launch_configuration" "negative2" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "m4.large"
  spot_price    = "0.001"
  user_data_base64 = "c29tZUtleQ==" # someKey

  lifecycle {
    create_before_destroy = true
  }

  ebs_block_device {
    device_name = "/dev/xvda1"
    encrypted = true
  }
}
