variable "cidr" {
  default = "172.16.0.0/22"
}

variable "subnets" {
  default = "a,b,c"
}

output "vpc_id" {
  value = "${aws_vpc.local.id}"
}

output "cidr" {
  value = "${var.cidr}"
}

output "subnets" {
  value = "${var.subnets}"
}

output "public_subnet_ids" {
  value = "${join(",", aws_subnet.public.*.id)}"
}

output "private_subnet_ids" {
  value = "${join(",", aws_subnet.private.*.id)}"
}

output "public_routes_id" {
  value = "${aws_route_table.public.id}"
}

output "private_routes_id" {
  value = "${aws_route_table.private.id}"
}

resource "aws_vpc_dhcp_options" "local" {

  domain_name = "${var.identifier}-${var.deploy}.${var.region}.aws."
  domain_name_servers = [ "127.0.0.1", "172.16.0.2" ]

  tags {
    Name = "${var.identifier}-${var.deploy}"
  }
}

resource "aws_vpc_dhcp_options_association" "local" {
  vpc_id = "${aws_vpc.local.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.local.id}"

  depends_on = ["aws_vpc_dhcp_options.local"]
}

resource "aws_vpc" "local" {
  cidr_block = "${var.cidr}"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags {
    Name = "${var.identifier}-${var.deploy}"
  }
}

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.local.id}"
  cidr_block = "172.16.0.${64 * count.index}/26"
  availability_zone = "${var.region}${element(split(",", var.subnets), count.index)}"
  count = "${length(split(",", var.subnets))}"

  tags {
    Name = "${var.identifier}-${var.deploy}-public-${element(split(",", var.subnets), count.index)}"
  }
}

resource "aws_subnet" "private" {
  vpc_id = "${aws_vpc.local.id}"
  cidr_block = "172.16.1.${64 * count.index}/26"
  availability_zone = "${var.region}${element(split(",", var.subnets), count.index)}"
  count = "${length(split(",", var.subnets))}"

  tags {
    Name = "${var.identifier}-${var.deploy}-private-${element(split(",", var.subnets), count.index)}"
  }
}

resource "aws_internet_gateway" "local" {
  vpc_id = "${aws_vpc.local.id}"

  tags {
    Name = "${var.identifier}-${var.deploy}"
  }
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "local" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.public.0.id}"

  depends_on = [ "aws_internet_gateway.local" ]
}

resource "aws_route_table_association" "public" {
  subnet_id = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
  count = "${length(split(",", var.subnets))}"
}

resource "aws_route_table_association" "private" {
  subnet_id = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
  count = "${length(split(",", var.subnets))}"
}

resource "aws_route_table" "public" {
  depends_on = [ "aws_internet_gateway.local" ]

  vpc_id = "${aws_vpc.local.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.local.id}"
  }

  tags {
    Name = "${var.identifier}-${var.deploy}-public"
  }
}

resource "aws_route_table" "private" {
  depends_on = [ "aws_nat_gateway.local" ]

  vpc_id = "${aws_vpc.local.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.local.id}"
  }

  tags {
    Name = "${var.identifier}-${var.deploy}-private"
  }
}
