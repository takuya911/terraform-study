resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"
  tags = {
    Name = "go-pf"
  }
}

resource "aws_eip" "nat_1a" {
  vpc = true
  tags = {
    Name = "go-pf-natgw-1a"
  }
}

resource "aws_nat_gateway" "nat_1a" {
  subnet_id     = "${aws_subnet.public_1a.id}"
  allocation_id = "${aws_eip.nat_1a.id}"

  tags = {
    Name = "go-pf-1a"
  }
}