resource "aws_security_group" "es-sg" {
  name   = "es-sg"
  vpc_id = local.vpc_id

  ingress {
    from_port   = "9200"
    to_port     = "9200"
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
    Name = "es-sg"
  }
}

module "es-instance" {
  source = "zkfmapf123/simpleEC2/lee"

  instance_name      = "es-instance"
  instance_region    = local.region
  instance_subnet_id = local.subnet_id
  instance_sg_ids    = [aws_security_group.ssh-sg.id, aws_security_group.es-sg.id]

  instance_ip_attr = {
    is_public_ip  = true
    is_eip        = true
    is_private_ip = false
    private_ip    = ""
  }

  instance_root_device = {
    size = 50
    type = "gp3"
  }

  instance_key_attr = {
    is_alloc_key_pair = false
    is_use_key_path   = true
    key_name          = ""
    key_path          = "~/.ssh/id_rsa.pub"
  }

  instance_tags = {
    "Monitoring" : true,
    "MadeBy" : "terraform"
    "Property" : "es"
  }

  user_data_file = "./user_data.sh"
}
