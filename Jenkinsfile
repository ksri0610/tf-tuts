pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_id01') // Use Jenkins credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('aws_id01') // Use Jenkins credentials ID
        AWS_DEFAULT_REGION    = 'ap-south-1' // Set the default AWS region
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ksri0610/tf-tuts.git' // Replace with your repo
            }
        }

        stage('Create S3 Bucket') {
            steps {
                script {
                    // Generate a unique bucket name using timestamp
                    def timestamp = sh(script: 'date +%s', returnStdout: true).trim()
                    def bucketName = "my-s3-bucket-${timestamp}"
                    
                    // Create S3 bucket in ap-south-1
                    sh """
                        aws s3api create-bucket \
                            --bucket ${ts-tuts-state} \
                            --region ${ap-south-1} \
                            --create-bucket-configuration LocationConstraint=${ap-south-1}
                    """
                    echo "S3 bucket '${ts-tuts-state}' created successfully in ${ap-south-1}."
                }
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
            echo 'EC2 instance and S3 bucket created successfully!'
        }
        failure {
            echo 'Failed to create EC2 instance or S3 bucket.'
        }
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
