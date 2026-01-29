resource "aws_key_pair" "terra_key" {
  key_name   = var.key_name
  public_key = file("/root/code/terra-key.pub")
}


resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.public_subnets[0]
  key_name               = aws_key_pair.terra_key.key_name
  vpc_security_group_ids = [var.sg_id]
}

resource "aws_launch_template" "lt" {
  image_id      = var.ami
  instance_type = var.instance_type
  key_name               = aws_key_pair.terra_key.key_name
  vpc_security_group_ids = [var.sg_id]
}

resource "aws_autoscaling_group" "asg" {
  min_size = 2
  max_size = 4
  desired_capacity = 2
  vpc_zone_identifier = var.private_subnets

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
}

resource "aws_lb" "alb" {
  name               = "web-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [var.sg_id]
}
