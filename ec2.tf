# ec2.tf


# 리소스 정의
resource "aws_instance" "ubuntu_instance" {
  ami                         = "ami-0c9c942bd7bf113a2" # Ubuntu 22.04
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.master-subnet.id
  associate_public_ip_address = true # Elastic IP 주소 자동 할당
  key_name                    = "doo"


  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/USER/Downloads/doo.pem") # SSH 개인 키 경로에 맞게 변경합니다.
    host        = self.public_ip                          # 인스턴스의 공개 IP에 접속합니다.
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y linux-image-5.19.0-1026-aws",
      "sudo apt upgrade -y",
      "sudo apt install -y nginx",
      "sudo reboot"
    ]
    
  }


  tags = {
    Name = "web-server"
  }
}
