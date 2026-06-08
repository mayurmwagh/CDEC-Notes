pipeline{
    agent {
        label 'node-new'
    }
    stages{
        stage('print-hostname') {
            steps {
                sh 'hostname'
            }
        }
    }
}