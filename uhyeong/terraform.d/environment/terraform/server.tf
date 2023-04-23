# Subnet - Data Source
data "aws_subnet" "subnet_public" {
    id = [
        aws_subnet.subnet_public_1.id,
        aws_subnet.subnet_public_2.id
    ]
}

data "aws_subnet" "subnet_private" {
    id = [
        aws_subnet.subnet_private_1.id,
        aws_subnet.subnet_private_2.id
    ]
}

# AMI - Data Source
data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.????????.?-x86_64-gp2"]
  }

	owners = ["amazon"]
}

# EC2 Instance
resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.subnet_public[0]

  tags = {
    Name = "Project_Bastion_Server"
  }
}

resource "aws_instance" "production_1" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.subnet_private[0]

  tags = {
    Name = "Project_Production_Server_1"
  }
}

resource "aws_instance" "production_2" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.subnet_private[1]

  tags = {
    Name = "Project_Production_Server_2"
  }
}

resource "aws_instance" "staging" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.subnet_private[0]

  tags = {
    Name = "Project_Staging_Server"
  }
}

resource "aws_instance" "develop" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.subnet_private[0]

  tags = {
    Name = "Project_Develop_Server"
  }
}
