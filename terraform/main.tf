provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu 20.04 LTS (example)
  instance_type = "t2.micro"
  key_name      = "aws mini project"

  tags = {
    Name = "Jenkins-Server"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install docker.io -y
              systemctl start docker
              usermod -aG docker ubuntu
              apt install openjdk-11-jdk -y
              wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
              sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
              apt update -y
              apt install jenkins -y
              systemctl start jenkins
              EOF
}
