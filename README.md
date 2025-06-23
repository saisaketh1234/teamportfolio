# Flask CI/CD Project with Docker, Jenkins, and Terraform

## 📦 Project Structure
```
flask-ci-cd-project/
├── flask-app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── terraform/
│   └── main.tf
├── jenkins/
│   └── build.sh
└── README.md
```

## 🛠️ Steps to Run

### 1. Provision EC2 using Terraform
```bash
cd terraform
terraform init
terraform apply
```

### 2. SSH into EC2
```bash
ssh -i "~/.ssh/aws mini project.pem" ubuntu@<EC2_PUBLIC_IP>
```

### 3. Jenkins Setup
- Open: http://<EC2_PUBLIC_IP>:8080
- Unlock Jenkins using:
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
- Create Freestyle Job
- Use GitHub repo or upload manually
- Add build step: paste `jenkins/build.sh` contents

### 4. Access Flask App
```
http://<EC2_PUBLIC_IP>:5000
```

## ✅ Done!
