# this  makes  vpc.id which is aws_vpc.proj1.id
resource "aws_vpc" "project1" {
  cidr_block = "10.52.0.0/16"

  tags = {
    Name     = "project1"
    Service  = "project1service"
    Owner    = "EastCoast"
    Location = "Eastside"
  }
}
