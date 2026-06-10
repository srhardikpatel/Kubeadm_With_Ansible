def configuration = [
    vaultUrl: 'http://35.175.176.187:8200',
    vaultCredentialId: 'vault-token',
    engineVersion: 1,
    skipSslVerification: true
]
def secrets = [
    [path: 'aws/creds/jenkins-role', 
            secretValues: [
                [vaultKey: 'access_key', envVar: 'AWS_ACCESS_KEY_ID'],
                [vaultKey: 'secret_key', envVar: 'AWS_SECRET_ACCESS_KEY'],
                [vaultKey: 'session_token', envVar: 'AWS_SESSION_TOKEN']
            ]
    ]
]

pipeline {
    agent any
    stages {
        stage('Terraform init') {
          steps {
            script {
              def fileContent = readFile(file: '../plan_output.txt', encoding: 'UTF-8')
            
            // Print the content to console for verification
            echo "File Content: ${fileContent}"
              if (fileContent) {
                withVault([configuration: configuration, vaultSecrets: secrets]) {
                  sh(script: """
                      terraform init \
                      -backend-config="bucket=${fileContent}" \
                      -backend-config="key=dev/terraform.tfstate"
                  """, returnStdout: true).trim()
                }
              } else {
                  error "Failing the build because a bucket name is empty."
              }
            }
          }
        }
        stage('Terraform plan') {
            steps {
              withVault([configuration: configuration, vaultSecrets: secrets]) {
                    sh 'terraform plan -out=tfplan'
              }
            }
        }
        stage('Terraform apply') {
            steps {
                withVault([configuration: configuration, vaultSecrets: secrets]) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}
