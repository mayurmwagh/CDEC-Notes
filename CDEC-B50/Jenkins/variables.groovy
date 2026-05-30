pipeline {
    agent any 
    environment {
        APP_NAME = 'CloudBlitz'
        ENVIRONMENT = 'Production' 
        COMAPNY_NAME = 'CBZ'
        CITY = 'Pune'   
    }
    stages {
        stage('APP_NAME'){
            steps{
                sh 'echo ${APP_NAME}'
            }
        }
        stage('ENVIRONMENT'){
            steps{
                sh 'echo ${ENVIRONMENT}'
            }
        }
        stage('COMAPNY_NAME'){
            steps{
                sh 'echo ${COMAPNY_NAME}'
            }
        }
        stage('CITY'){
            steps{
                sh 'echo ${CITY}'
            }
        }
    }

}


# Default variables in Jenkins (built-in variables)

    pipeline {
        agent any 
        stages {
            stage('Default variables in Jenkins'){
                steps{
                    sh 'echo "BUILD_NUMBER: ${BUILD_NUMBER}"'
                    sh 'echo "BUILD_ID: ${BUILD_ID}"'
                    sh 'echo "BUILD_URL: ${BUILD_URL}"'
                    sh 'echo "JOB_NAME: ${JOB_NAME}"'
                    sh 'echo "WORKSPACE: ${WORKSPACE}"'
                }
            }
        }
    }




