  resource "aws_vpc" "ecs_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "week_19_project_vpc"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = "10.0.2.0/24"
  map_public_ip_on_launch = true 
  availability_zone = "us-east-1a"

  tags = {
    Name = "public subnet 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.ecs_vpc.id
  map_public_ip_on_launch = true
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public subnet 2"
  }
}

resource "aws_ecs_cluster" "cluster" {
  name = "week_19_ecs_cluster"

  capacity_providers = ["FARGATE_SPOT", "FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
  }
}

resource "docker_image" "centos" {
  name = "centos:latest"
}