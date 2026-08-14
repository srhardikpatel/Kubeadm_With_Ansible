def configuration = [
    vaultUrl: 'http://3.91.198.177:8200',
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
        stage('Terraform init') {
            steps {
              withVault([configuration: configuration, vaultSecrets: secrets]) {
                    sh 'terraform init'
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
        stage('Create a output file') {
            steps {
                    sh 'terraform output -raw bucket_name -no-color > ../plan_output.txt'
            }
        }
        stage('Run EC2 instance') {
            steps {
                  build "create_ec2_instance"
            }
        }
    }
}
