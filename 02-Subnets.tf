#These are   for  public

resource "aws_subnet" "public-ap-southeast-4a" {
  vpc_id                  = aws_vpc.project1.id
  cidr_block              = "10.52.1.0/24"
  availability_zone       = "ap-southeast-4a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "public-ap-southeast-4a"
    Service  = "project1"
    Owner    = "Eastcoast"
    Location = "Eastside"
  }
}

resource "aws_subnet" "public-ap-southeast-4b" {
  vpc_id                  = aws_vpc.project1.id
  cidr_block              = "10.52.2.0/24"
  availability_zone       = "ap-southeast-4b"
  map_public_ip_on_launch = true

  tags = {
    Name     = "public-ap-southeast-4b"
    Service  = "project1"
    Owner    = "Eastcoast"
    Location = "Eastside"
  }
}


resource "aws_subnet" "public-ap-southeast-4c" {
  vpc_id                  = aws_vpc.project1.id
  cidr_block              = "10.52.3.0/24"
  availability_zone       = "ap-southeast-4c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "public-ap-southeast-4c"
    Service  = "project1"
    Owner    = "Eastcoast"
    Location = "Eastside"
  }
}

#these are for private
resource "aws_subnet" "private-ap-southeast-4a" {
  vpc_id            = aws_vpc.project1.id
  cidr_block        = "10.52.11.0/24"
  availability_zone = "ap-southeast-4a"

  tags = {
    Name     = "private-ap-southeast-4a"
    Service  = "project1"
    Owner    = "Eastcoast"
    Location = "Eastside"
  }
}

resource "aws_subnet" "private-ap-southeast-4b" {
  vpc_id            = aws_vpc.project1.id
  cidr_block        = "10.52.12.0/24"
  availability_zone = "ap-southeast-4b"

  tags = {
    Name     = "private-ap-southeast-4b"
    Service  = "project1"
    Owner    = "Eastcoast"
    Location = "Eastside"
  }
}

resource "aws_subnet" "private-ap-southeast-4c" {
  vpc_id            = aws_vpc.project1.id
  cidr_block        = "10.52.13.0/24"
  availability_zone = "ap-southeast-4c"

  tags = {
    Name     = "private-ap-southeast-4c"
    Service  = "project1"
    Owner    = "Eastcoast"
    Location = "Eastside"
  }
}
