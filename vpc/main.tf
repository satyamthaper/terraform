resource "aws_vpc" "example_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidrs)

  cidr_block = var.public_subnet_cidrs[count.index]
  vpc_id     = aws_vpc.example_vpc.id
  map_public_ip_on_launch = true
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

