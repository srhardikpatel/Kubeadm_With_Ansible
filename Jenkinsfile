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
            echo "${cat ../plan_output.txt}"
            script {
              if (env.BUCKETNAME) {
                  sh(script: """
                      terraform init \
                      -backend-config="bucket=${cat ../plan_output.txt}" \
                      -backend-config="key=dev/terraform.tfstate"
                  """, returnStdout: true).trim()
              } else {
                  error "Failing the build because a bucket name is empty."
              }
           }
          }
      }
  }
}
