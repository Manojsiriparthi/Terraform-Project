resource "aws_instance" "ic" {
ami = "ami-0c8e23f950c7725b9"
instance_type = "t2.micro"
key_name = "terraform"
vpc_security_group_ids = [aws_security_group.sg.id]
subnet_id = aws_subnet.sub1.id
user_data = base64encode(file("userdata.sh"))
root_block_device {
  volume_size = "10"
}
tags = {
    name = "Terraform-Project1"
}
}

resource "aws_instance" "ic1" {
ami = "ami-0c8e23f950c7725b9"
instance_type = "t2.micro"
key_name = "terraform"
vpc_security_group_ids = [aws_security_group.sg.id]
subnet_id = aws_subnet.sub2.id
user_data = base64encode(file("userdata1.sh"))
root_block_device {
  volume_size = "10"
}
tags = {
    name = "Terraform-Project2"
}
}