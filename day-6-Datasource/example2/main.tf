data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

# not recomanded 

data "aws_security_group" "dev" {
  id = "sg-0f5091e276b3b1ac6" #here change your sg id details"

}
data "aws_subnet" "dev" {
  id = "subnet-097faf7b1ce11fc0a" #here chnage your subnet id details
}
resource "aws_instance" "dev" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.dev.id
    security_groups = [data.aws_security_group.dev.id]

    tags = {
      Name = "dev-ec2"
    }
}