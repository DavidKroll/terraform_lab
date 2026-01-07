resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.vm-size

  tags = {
    Name = var.vm-name
  }
}