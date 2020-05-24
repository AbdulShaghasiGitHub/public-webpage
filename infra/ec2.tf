# create an application load balancer in the public layer.
# first we need to create a security group to allow and limit access to the our cloud
resource "aws_security_group" "cloud_sg" {
  description = "Allow http and ssh to the cloud at public layer"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "http from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh from internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "mysql port"
    from_port   = 3306
    to_port     = 3306
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
    Name = "cloud_http"
  }
}

# second we create a target group for our load balancer.
resource "aws_lb_target_group" "cloud" {
  name     = "cloud-Target-Group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

# thirdly we create application load balancer.
resource "aws_lb" "cloud_lb" {
  name               = "cloud-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.cloud_sg.id]
  subnets            = [aws_subnet.public_az1.id, aws_subnet.public_az2.id, aws_subnet.public_az3.id]

  tags = {
    Environment = "production"
  }
}
# finally we add the load balancer listener for the deployed lb
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.cloud_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cloud.arn
  }
}

# create a key pair to allow ssh to the ec2 instance
resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer-key"
  public_key = var.public_key
}

# filter the latest Amazon Linux Image
data "aws_ami" "latest_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-2018.03.0.20200514.0-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}

# create aws instance using the above filter image
resource "aws_instance" "cloud_Server" {
  ami                         = data.aws_ami.latest_image.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private_az1.id
  associate_public_ip_address = "true"
  key_name                    = "deployer-key"
  vpc_security_group_ids      = [aws_security_group.cloud_sg.id]
  tags = {
    Name = "cloud_Server"
  }
}

# attach aws_lb_target_group to the ec2-instance
resource "aws_lb_target_group_attachment" "attach_tg" {
  target_group_arn = aws_lb_target_group.cloud.arn
  target_id        = aws_instance.cloud_Server.id
  port             = 80
}