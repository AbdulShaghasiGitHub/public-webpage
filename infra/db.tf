# create security group for database instance to allow access to database
resource "aws_security_group" "database_sg" {
  description = "Allow tcp connection to database from the internal ec2 instance on port 3603"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "tcp from ec2 instance"
    from_port   = 3606
    to_port     = 3606
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database_sg"
  }
}

# subnet group for db instance
resource "aws_db_subnet_group" "default" {
  name        = "cloud-db"
  description = "cloud database"
  subnet_ids  = [aws_subnet.data_az1.id, aws_subnet.data_az2.id]
}


# create an rds aroura cluster to allow the application to store and retrieve data
resource "aws_db_instance" "default" {
  identifier              = "cloud-db"
  vpc_security_group_ids  = [aws_security_group.database_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.default.name
  instance_class          = "db.t2.micro"
  name                    = "cloud"
  username                = "root"
  password                = "password"
  backup_retention_period = 7
  skip_final_snapshot     = true
  engine                  = "mysql"
  engine_version          = "5.7"
  allocated_storage       = 20
}

