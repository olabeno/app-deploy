resource "aws_security_group" "microk8s_sg" {
  name        = "microk8s-security-group"
  description = "Allow SSH and Kubernetes access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change for security
  }

  ingress {
    from_port   = 16443
    to_port     = 16443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = -1              # -1 allows all ICMP types
    to_port     = -1              # -1 allows all ICMP codes
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]   # Replace with a more restricted CIDR if needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 tags = {
    Name = "MicroK8sSG"
  }
}
