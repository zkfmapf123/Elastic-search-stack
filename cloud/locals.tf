data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}

data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = ["pick"]
  }
}

locals {
  vpc_id    = data.aws_vpc.vpc.id
  subnet_id = data.aws_subnet.subnet.id
  region    = data.aws_subnet.subnet.availability_zone
}
