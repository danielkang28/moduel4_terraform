
# resource "aws_eip" "shopping_eip" {
# #   vpc = true
#   domain = "vpc"

#   instance                  = aws_instance.ubuntu_instance.id
#   associate_with_private_ip = aws_instance.ubuntu_instance.private_ip
#   depends_on                = [aws_internet_gateway.shopping-igw]
# }

