resource "aws_vpc" "vp" {
    tags = {
        Name = "Terraform-vpc"
    }
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = "true"

}

resource "aws_subnet" "sub1" {
    tags = {
        Name = "Terraform-subnet1"
    }
vpc_id = aws_vpc.vp.id
availability_zone = "us-east-1a"
cidr_block = "10.0.1.0/24"
map_public_ip_on_launch = "true"
}

resource "aws_subnet" "sub2" {
    tags = {
        Name = "Terraform-subnet2"
    }
vpc_id = aws_vpc.vp.id
availability_zone = "us-east-1b"
cidr_block = "10.0.2.0/24"
map_public_ip_on_launch = "true"
}

resource "aws_internet_gateway" "igw" {
    tags = {
        Name = "Terraform-igw"
    }
    vpc_id = aws_vpc.vp.id
}

resource "aws_route_table" "rt" {
    tags = {
        Name = "Terraform-Rt"
    }
    vpc_id = aws_vpc.vp.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "rt1" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rt2" {
    subnet_id = aws_subnet.sub2.id
    route_table_id = aws_route_table.rt.id
}