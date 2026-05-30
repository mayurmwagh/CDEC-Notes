# Declarative Pipeline 
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                 sh 'touch mayur.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'ls -l'
            }
        }
        stage('Deploy') {
            steps {
                 sh 'pwd'
            }
        }
    }
}

# Scripted Pipeline
node {
    stage('Build') {
        echo 'Building...'
        // Add your build steps here
    }
    stage('Test') {
        echo 'Testing...'
        // Add your test steps here
    }
    stage('Deploy') {
        echo 'Deploying...'
        // Add your deploy steps here                                                  
    }
}