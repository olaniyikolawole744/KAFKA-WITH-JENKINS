pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = credentials ('AWS_DEFAULT_REGION')
        ACCESS_KEY = credentials ('ACCESS_KEY')
        SECRET_KEY = credentials ('SECRET_KEY')
    }

    stages {
        stage('Build VPC.') {
            steps {
           
           sh '-e $AWS_ACCESS_KEY_ID -e $AWS_SECRET_ACCESS_KEY -e $AWS_DEFAULT_REGION && ls && cd vpc-module && terraform init && terraform plan -var-file=vpc.tfvars && terraform apply -var-file=vpc.tfvars --auto-approve'
                        
            }
        }
        stage('Build AMI') {
            steps {
                sh 'ls && cd packer && ls && export PACKER_LOG=1 && export PACKER_LOG_PATH=$WORKSPACE/packer.log && echo "packer log path:" $PACKER_LOG_PATH && /usr/bin/packer build linux.json &&  /usr/bin/packer build ubuntu.json'
            }
        }
        stage('Create Broker Node') {
            steps {
                sh 'ls && cd server && ls && cd Kafka-broker-node && ls && terraform init && terraform plan -var-file=toolbox1.tfvars && terraform apply -var-file=toolbox1.tfvars --auto-approve'
            }
        }
        stage('Create Zookeeper Node') {
            steps {
                sh 'ls && cd server && cd kafka-zookeeper-node && ls && terraform init && terraform plan -var-file=toolbox1.tfvars && terraform apply -var-file=toolbox1.tfvars --auto-approve'
            }
        }
        stage('Create Tool-server-1') {
            steps {
                sh 'ls && cd server && cd Tool-server-1 && ls && terraform init && terraform plan -var-file=monitoring.tfvars && terraform apply -var-file=monitoring.tfvars --auto-approve'
            }
        }
        stage('Play Ansible playbook') {
            steps {
                sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playbookbroker.yml -i inventory/hosts/host'
            }
        }
    }
}


