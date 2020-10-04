resource "aws_subnet" "public_1a" {
  vpc_id = "${aws_vpc.main.id}"
  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "go-pf-public-1a"
  }
}

# Private Subnets
resource "aws_subnet" "private_1a" {
  vpc_id = "${aws_vpc.main.id}"
  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.10.0/24"
  tags = {
    Name = "go-pf-private-1a"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id = "${aws_vpc.main.id}"

  availability_zone = "ap-northeast-1c"

  cidr_block        = "10.0.2.0/24"

  tags = {
    Name = "go-pf-public-1c"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id = "${aws_vpc.main.id}"

  availability_zone = "ap-northeast-1c"
  cidr_block        = "10.0.20.0/24"

  tags = {
    Name = "go-pf-private-1c"
  }
}

resource "aws_subnet" "public_1d" {
  vpc_id = "${aws_vpc.main.id}"

  availability_zone = "ap-northeast-1d"

  cidr_block        = "10.0.3.0/24"

  tags = {
    Name = "go-pf-public-1d"
  }
}

resource "aws_subnet" "private_1d" {
  vpc_id = "${aws_vpc.main.id}"

  availability_zone = "ap-northeast-1d"
  cidr_block        = "10.0.30.0/24"

  tags = {
    Name = "go-pf-private-1d"
  }
}