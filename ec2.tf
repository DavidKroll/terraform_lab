resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.vm-size
  count = var.novm
  # attaching security group to ec2 vm
  vpc_security_group_ids = [aws_security_group.allow_rules.id]
  tags = {
    Name = "${var.vm-name}-${count.index}"
  }
}