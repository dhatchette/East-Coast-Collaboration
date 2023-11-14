resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.project1.id

  tags = {
    Name     = "project1_IG"
    Service  = "project1service"
    Owner    = "Eastcoast"
    Location = "Eastside"
  }
}
