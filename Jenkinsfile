pipeline {
  agent any

  environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
    }
  
  stages {
      stage('Terraform init') {
          steps {
            sh 'terraform init'
          }
      }
      stage('Terraform plan') {
          steps {
            sh 'terraform plan -out=tfplan'
          }
      }
      stage('Terraform apply') {
          steps {
            sh 'terraform apply -auto-approve tfplan'
          }
      }
      stage('Create a output file') {
            steps {
              sh 'terraform output -raw bucket_name -no-color > ../plan_output.txt'
            }
      }
  }
}
