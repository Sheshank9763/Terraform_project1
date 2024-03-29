resource "aws_instance" "public-ec2" {
    ami = "ami-008fe2fc65df48dac"
    subnet_id = aws_subnet.public1.id
    tags = {
      Name = "public-ec2"
    }
    key_name = "sheshi"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    security_groups = [ aws_security_group.sg1.id ]
}
resource "aws_instance" "private-ec2" {
    ami = "ami-008fe2fc65df48dac"
    subnet_id = aws_subnet.public2.id
    tags = {
      Name = "private-ec2"
    }
    key_name = "sheshi"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.sg1.id]
}
