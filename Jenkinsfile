pipeline {
    agent any
    parameters {
        choice choices: ['dev', 'uat', 'prod'], description: 'Please select the environment.', name: 'ENVIRONMENT'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Source Code Management') {
            steps {
                git branch: 'master', url: 'https://github.com/devopscls/FoodTrucks.git'
            }
        }
        stage('Trivy scan') {
            steps {
                sh 'trivy fs --severity CRITICAL,HIGH,MEDIUM,LOW --format table -o trivy-report.txt .'
            }
        }
        stage('Trivy report') {
            steps {
                sh 'cat trivy-report.txt'
            }
        }
        stage('change permissions .sh') {
            steps {
                sh 'chmod +x *.sh'
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (params.ENVIRONMENT == 'dev') {
                        echo "Deploying to DEV environment..."
                        sh './testfood.sh dev'
                    } else if (params.ENVIRONMENT == 'uat') {
                        echo "Deploying to UAT environment..."
                        sh './testfood.sh uat'
                    } else if (params.ENVIRONMENT == 'prod') {
                        echo "Deploying to PROD environment..."
                        sh './testfood.sh prod'
                        sh './highfood.sh prod'
                    }
                }
            }
        }
    }
}
