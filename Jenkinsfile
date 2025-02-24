pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '<CREDS>', url: 'https://github.com/ksri0610/tf-tuts.git'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
        
    }
}
