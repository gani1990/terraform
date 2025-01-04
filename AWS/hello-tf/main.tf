
resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "hello-tf"
  }

}

resource "aws_subnet" "app" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.10.1.0/24"
  tags = {
    Name = "app-1"
  }

  depends_on = [aws_vpc.main]
}

resource "aws_subnet" "DB" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1b"
  cidr_block        = "10.10.2.0/24"
  tags = {
    Name = "DB-1"
  }

  depends_on = [aws_vpc.main]
}
