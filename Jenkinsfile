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
            script {
            sh(script: """
                      cat "plan_output.txt"
                  """, returnStdout: true).trim()
          }
          }
      }
  }
}
