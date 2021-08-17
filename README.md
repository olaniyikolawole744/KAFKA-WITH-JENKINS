# KAFKA DRIVEN SYSTEM

This project setup infrastructure using Terraform and packer for the
infrastructure and software components. It uses Ansible for Kafka and python code configuration.

### Requirements 

```
Terraform
Packer
```

## TASK EXECUTION

### CREATE VPC
```
- cd vpc-module 
- terraform init
- terraform apply '-var-file=vpc.tfvars' --auto-approve
- cd ..
```


### CREATE AMI
```
- cd packer 
- packer build linux.json
- packer build ubuntu.json
- cd ..
```

### CREATE NODES
```
- cd server
- cd kafka-broker-node
- terraform init 
- terraform apply '-var-file=toolbox1.tfvars' --auto-approve
- cd ..
```

```
- cd kafka-zookeeper-node
- terraform init 
- terraform apply '-var-file=toolbox1.tfvars' --auto-approve
- cd ..
```

```
- cd Tool-server-1
- terraform init 
- terraform apply '-var-file=monitoring.tfvars' --auto-approve
- cd ..
```

### SETUP INSTALLATIONS AND CONFIGURATIONS
```
- cd playbook
- edit inventory/hosts/host file
- run ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playbook.yml -i inventory/hosts/host
- cd ..
```

### START ZOOKEEPER
```
- bin/zookeeper-server-start.sh config/zookeeper.properties
```

### START KAFKA BROKER
```
- bin/kafka-server-start.sh config/kafka.properties
```

### RUN PRODUCER CODE 
```
- python producer_message.py
```

### RUN CONSUMER CODE 
```
- python consumre_message.py
```

