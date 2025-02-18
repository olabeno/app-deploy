resource "aws_instance" "microk8s" {
  ami           = "ami-04b4f1a9cf54c11d0" 
  instance_type = "t2.micro"
  key_name      = "microk8s_key"

  associate_public_ip_address = true

  security_groups = [aws_security_group.microk8s_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y snapd
              sudo snap install microk8s --classic
              sudo usermod -aG microk8s ubuntu
              sudo chown -R ubuntu ~/.kube
              microk8s status --wait-ready
              microk8s enable dns dashboard storage
              microk8s kubectl config view --raw > /home/ubuntu/.kube/config
              chown ubuntu:ubuntu /home/ubuntu/.kube/config
              EOF

  tags = {
    Name = "MicroK8s-Instance"
  }
}







