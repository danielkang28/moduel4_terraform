# ec2.tf

# # 키페어 생성
# resource "aws_key_pair" "example_keypair" {
#   key_name   = "terraform_keypair"
#   public_key = file("C:/Users/USER/.ssh/id_rsa.pub") # 공개 키 경로에 맞게 변경합니다.
# }


# 리소스 정의
# resource "aws_instance" "ubuntu_instance" {
#   ami           = "ami-0d52744d6551d851e" # Ubuntu 22.04
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.master-subnet.id
#   associate_public_ip_address = true  # Elastic IP 주소 자동 할당

#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file("C:/Users/USER/Downloads/doo.pem") # SSH 개인 키 경로에 맞게 변경합니다.
#     host        = self.public_ip                          # 인스턴스의 공개 IP에 접속합니다.
#   }

#   # 프로비저닝 설정
#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update",
#       "sudo apt upgrade",
#       "sudo apt install -y nginx"
#     ]
#   }
  
#   tags = {
#     Name = "web-server"
#   }
# }


# resource "aws_network_interface" "shopping-nic" {
#   subnet_id   = aws_subnet.master-subnet.id
#   private_ips = ["10.0.0.10"]
# }

