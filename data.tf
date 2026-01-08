data "aws_vpc" "example" {
  id = "vpc-07eede624774fec02"
}
#creating security group
resource "aws_security_group" "allow_rules" { #allow_tls is just a sample)
  name        = "dkroll_allow_rules"
  description = "Allow rules inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.example.id # changed

  tags = {
    Name = "dkroll_allow_rules"
  }
}
#add egress roles Outbound ipv4 and ipvp
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_rules.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.allow_rules.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# ingress 22 and 80 port allow

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_rules.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_rules.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
 