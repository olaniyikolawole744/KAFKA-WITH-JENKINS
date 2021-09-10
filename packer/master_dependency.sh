# NEW STEPS INSTALL DEPENDENCIES
wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
sudo tar xzf Python-2.7.18.tgz
sudo yum install python2.7 pip -y
pip2.7 install boto
sudo amazon-linux-extras install ansible2
pip2.7 install boto3
ec2.py
#ec2.ini



#NEW STEPS GENERATE SSH KEYS...
#on host server:
touch /home/ec2-user/.ssh/id_rsa
touch /home/ec2-user/.ssh/id_rsa.pub
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPU97b9uaJd7KZCdGrFIKeSnHh3cHKqOyST9Q/X4ZCEw 14809@LAPTOP-ND13IS36' >> /home/ec2-user/.ssh/id_rsa.pub
echo '-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACD1Pe2/bmiXeymQnRqxSCnkpx4d3Byqjskk/UP1+GQhMAAAAJhImd4dSJne
HQAAAAtzc2gtZWQyNTUxOQAAACD1Pe2/bmiXeymQnRqxSCnkpx4d3Byqjskk/UP1+GQhMA
AAAEBmG7i6VxhlPcfzTN3IM5yq/a1Pc9oyXU39zK/YcTs2rPU97b9uaJd7KZCdGrFIKeSn
Hh3cHKqOyST9Q/X4ZCEwAAAAFTE0ODA5QExBUFRPUC1ORDEzSVMzNg==
-----END OPENSSH PRIVATE KEY-----' >> /home/ec2-user/.ssh/id_rsa