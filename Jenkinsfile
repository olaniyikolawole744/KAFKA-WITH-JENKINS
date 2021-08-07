pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'us-east-1'
    }

    stages {
        stage('Build VPC') {
            steps {
                sh 'ls && cd vpc-module && terraform init && terraform plan -var-file=vpc.tfvars && terraform apply -var-file=vpc.tfvars --auto-approve'
            }
        }
        stage('Build AMI') {
            steps {
                sh 'ls && cd packer && ls && export PACKER_LOG=1 && export PACKER_LOG_PATH=$WORKSPACE/packer.log && echo "packer log path:" $PACKER_LOG_PATH && /usr/bin/packer build linux.json &&  /usr/bin/packer build ubuntu.json'
            }
        }
        stage('Create Broker Node') {
            steps {
                sh 'ls && cd server && ls && cd Kafka-broker-node && ls && terraform init && terraform plan -var-file=toolbox1.tfvars'
            }
        }
        stage('Create Zookeeper Node') {
            steps {
                sh 'ls && cd server && cd kafka-zookeeper-node && ls && terraform init && terraform plan -var-file=toolbox1.tfvars'
            }
        }
        stage('Create Tool-server-1') {
            steps {
                sh 'ls && cd server && cd Tool-server-1 && ls && terraform init && terraform plan -var-file=monitoring.tfvars'
            }
        }
    }
}


