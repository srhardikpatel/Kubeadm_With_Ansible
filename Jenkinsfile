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
              def fileContent = readFile(file: '../plan_output.txt', encoding: 'UTF-8')
            
            // Print the content to console for verification
            echo "File Content: ${fileContent}"
              if (fileContent) {
                  sh(script: """
                      terraform init \
                      -backend-config="bucket=${fileContent}" \
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
