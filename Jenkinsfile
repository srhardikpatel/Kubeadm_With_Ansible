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
        stage('Terraform destroy') {
            steps {
              withVault([configuration: configuration, vaultSecrets: secrets]) {
                  dir('../create_ec2_instance') {
                    sh 'terraform destroy -auto-approve'
                  }
              }
            }
        }
    }
}
