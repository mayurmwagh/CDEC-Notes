pipeline {
    agent {
        label 'node'
    }
    stages {
        stage('Pull') {
            steps {
                git branch: 'master', url: 'https://github.com/mayurmwagh/onlinebookstore.git'
            }
        }
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Testing'){
            steps {
                withSonarQubeEnv(credentialsId: 'sonar-token', installationName: 'Sonar') {
                    sh 'mvn sonar:sonar -Dsonar.projectKey=onlinebookstore'
                 
                }
            }
        }
    }
}



pipeline {
    agent any 
    stages {
        stage('Pull') {
            steps {
                git branch: 'master', url: 'https://github.com/mayurmwagh/onlinebookstore.git'
            }
        }
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Testing'){
            steps {
                withSonarQubeEnv(credentialsId: 'sonar-token', installationName: 'sonar') {
                    sh 'mvn sonar:sonar -Dsonar.projectKey=onlinebookstore'
                 
                }
            }
        }
    }
}