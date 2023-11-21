provider "aws" {
  region = "us-east-1"  # Specify your desired AWS region
}

resource "aws_db_instance" "example" {
  identifier            = "mydbinstance"
  allocated_storage     = 20
  storage_type          = "gp2"
  engine                = "mysql"
  engine_version        = "5.7"
  instance_class        = "db.t2.micro"
  name                  = "mydb"
  username              = "admin"
  password              = "your_password_here"
  parameter_group_name  = "default.mysql5.7"
  publicly_accessible   = false  # Set to true if you want the RDS instance to be publicly accessible

  # Uncomment the following lines if you want to use a specific subnet group and security group
  # db_subnet_group_name = aws_db_subnet_group.example.name
  # vpc_security_group_ids = [aws_security_group.example.id]

  tags = {
    Name = "MyDBInstance"
  }
}

# Uncomment the following block if you want to create a DB subnet group
# resource "aws_db_subnet_group" "example" {
#   name       = "my-db-subnet-group"
#   subnet_ids = ["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy", "subnet-zzzzzzzzzzzzzzzzz"]
#   tags = {
#     Name = "MyDBSubnetGroup"
#   }
# }

# Uncomment the following block if you want to create a security group for the RDS instance
# resource "aws_security_group" "example" {
#   name        = "my-db-security-group"
#   description = "My DB Security Group"
#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "MyDBSecurityGroup"
#   }
# }
