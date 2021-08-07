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
                sh 'ls && cd vpc-module && terraform init && terraform apply -var-file=vpc.tfvars && --auto-approve'
            }
        }
        stage('Build AMI') {
            steps {
                sh 'ls && cd packer && ls && packer build linux.json && packer build ubuntu.json && cd ..'
            }
        }
        stage('Create Broker Node') {
            steps {
                sh 'ls && cd server && ls && cd kafka-broker-node && ls && terraform init && terraform plan -var-file=toolbox1.tfvars && terraform apply -var-file=toolbox1.tfvars --auto-approve'
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
    }
}


