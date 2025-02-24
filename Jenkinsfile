pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_id') // Use Jenkins credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('aws_id') // Use Jenkins credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ksri0610/Terraform_multicloud_jenkins.git' // Replace with your repo
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        success {
            echo 'EC2 instance created successfully!'
        }
        failure {
            echo 'Failed to create EC2 instance.'
        }
    }
}
