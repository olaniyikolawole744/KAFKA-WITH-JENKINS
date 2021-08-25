variable "access_key" {
  type = string
  default = "${env("ACCESS_KEY_LENNIPSS")}"
  sensitive = true
}

variable "secret_key" {
  type = string
  default = "${env("SECRET_KEY_LENNIPSS")}"
  sensitive = true
}

variable "region" {
  type      = string
  default   = "us-east-1"
  sensitive = true
}

source "amazon-ebs" "linux" {
  tags = {
    Name = "custom-linux-ami"
  }
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  ssh_username  = "ec2-user"
  region        = "${var.region}"
  ami_name      = "linux_ami"
  source_ami    = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
}

source "amazon-ebs" "ubuntu" {
  tags = {
    Name = "custom-ubuntu-ami"
  }
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  ssh_username  = "ec2-user"
  region        = "${var.region}"
  ami_name      = "ubuntu_ami"
  source_ami    = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
}


build {
  sources = ["source.amazon-ebs.linux",
             "source.amazon-ebs.ubuntu",]
  provisioner "shell" {
    only   = ["source.amazon-ebs.linux"]
    script = "linux-script.sh"
  }
  provisioner "shell" {
    only   = ["source.amazon-ebs.ubuntu"]
    script = "ubuntu-script.sh"
  }
}