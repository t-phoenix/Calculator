pipeline {
    environment {
        registry = "abhinil/calculator"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Build') {
            steps{
                script {
                    dockerImage = docker.build registry + ":latest"
                }
            }
        }
        stage('test'){
            steps {
                sh 'pip3 install pytest --user'
                sh 'python3 -m pytest'
            }
        }
        stage('Archive'){
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                build 'deploy'
            }
        }
    }
}
