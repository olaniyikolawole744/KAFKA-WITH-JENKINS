# NEW STEPS INSTALL DEPENDENCIES
sudo yum install epel-release
wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
sudo tar xzf Python-2.7.18.tgz
sudo yum install Python2.7.18 pip -y
pip2.7 install boto
sudo amazon-linux-extras install ansible2
pip2.7 install boto3
chmod 755 ec2.py
chmod 755 ec2.ini



#NEW STEPS GENERATE SSH KEYS...
#on host server:
touch /home/ec2-user/.ssh/id_rsa
touch /home/ec2-user/.ssh/id_rsa.pub
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPU97b9uaJd7KZCdGrFIKeSnHh3cHKqOyST9Q/X4ZCEw 14809@LAPTOP-ND13IS36' >> /home/ec2-user/.ssh/id_rsa.pub
