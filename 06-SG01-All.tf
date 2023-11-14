resource "aws_security_group" "project1-sg01-servers" {
  name        = "proj1-sg01-servers"
  description = "proj1-sg01-servers"
  vpc_id      = aws_vpc.project1.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MyEvilBox"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "proj1-sg01-servers"
    Service  = "project1service"
    Owner    = "Eastcoast"
    Location = "Eastside"
  }

}





resource "aws_security_group" "project1-sg02-LB01" {
  name        = "proj1-sg02-LB01"
  description = "proj1-sg02-LB01"
  vpc_id      = aws_vpc.project1.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "proj1-sg02-LB01"
    Service  = "project1"
    Owner    = "EastCoast"
    Location = "Eastside"
  }

}
