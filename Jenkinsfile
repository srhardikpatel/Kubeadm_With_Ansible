pipeline {
  agent any

  parameters {
      string(name: 'BUCKETNAME', defaultValue: '')
  }
  
  environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
  }
  
  stages {
      stage('Terraform init') {
          steps {
            echo "${env.BUCKETNAME}"
            script {
              if (env.BUCKETNAME) {
                  sh(script: """
                      terraform init \
                      -backend-config="bucket=${env.BUCKETNAME}, key=dev/terraform.tfstate"
                  """, returnStdout: true).trim()
              } else {
                  error "Failing the build because a bucket name is empty."
              }
           }
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
  }
}
