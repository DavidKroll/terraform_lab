output "PublicIPs" {
  value = aws_instance.example.*.public_ip
  #value = aws_instance.example1.public_ip

 }
 output "Hostname"  {
    value = aws_instance.example.*.id
 }
