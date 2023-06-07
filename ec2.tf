# ec2.tf

# RSA 알고리즘을 이용해 private 키 생성.
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# private 키를 가지고 keypair 파일 생성.
resource "aws_key_pair" "kp" {
  key_name   = "ekskey"
  public_key = tls_private_key.pk.public_key_openssh
}

# 키 파일을 생성하고 로컬에 다운로드.
resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.kp.key_name}.pem"
  content = tls_private_key.pk.private_key_pem
}

# 리소스 정의
resource "aws_instance" "ubuntu_instance" {
  ami                         = "ami-0d52744d6551d851e" # Ubuntu 22.04
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.master-subnet.id
  associate_public_ip_address = true # Elastic IP 주소 자동 할당
  key_name                    = aws_key_pair.kp.key_name


  # connection {
  #   type        = "ssh"
  #   user        = "ubuntu"
  #   private_key = file("C:/Users/USER/Downloads/doo.pem") # SSH 개인 키 경로에 맞게 변경합니다.
  #   host        = self.public_ip                          # 인스턴스의 공개 IP에 접속합니다.
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt update",
  #     "sudo apt install -y linux-image-5.19.0-1026-aws",
  #     "sudo apt upgrade -y",
  #     "sudo apt install -y nginx",
  #     "sudo reboot"
  #   ]
  # }

  tags = {
    Name = "web-server"
  }
}

# resource "aws_instance" "ubuntu_instance" {
#   ami                         = "ami-0c9c942bd7bf113a2" # Ubuntu 22.04
#   instance_type               = "t3.micro"
#   subnet_id                   = aws_subnet.master-subnet.id
#   associate_public_ip_address = true # Elastic IP 주소 자동 할당
#   key_name                    = "doo"

#   tags = {
#     Name = "web-server"
#   }
# }
