def configuration = [
    vaultUrl: 'http://98.92.189.28:8200',
    vaultCredentialId: 'token',
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
        stage('Terraform destroy') {
            steps {
              withVault([configuration: configuration, vaultSecrets: secrets]) {
                  dir('../create_s3_bucket') {
                    sh 'terraform destroy -auto-approve'
                  }
              }
            }
        }
    }
}
