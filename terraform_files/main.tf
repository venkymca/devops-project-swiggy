resource "aws_security_group" "swiggy-sg" {
  name        = "swiggy-sg"
  description = "allow required SG"

  # Define a single ingress rule to allow traffic on all specified ports
  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "swiggy-sg"
  }
}


resource "aws_instance" "web" {
  ami                    = "ami-084568db4383264d4"
  instance_type          = "t2.large"
  key_name               = "pl"
  vpc_security_group_ids = [aws_security_group.swiggy-sg.id]
  user_data              = templatefile("./resource.sh", {})

  tags = {
    Name = "Prod-Server"
  }
  root_block_device {
    volume_size = 30
  }
}