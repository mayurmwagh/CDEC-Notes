pipeline{
    agent any 
    parameters {
        string(name: 'Name', defaultValue: 'Mayur', description: 'Enter your name')
        password(name: 'Password', defaultValue: '12345', description: 'Enter your password')
        booleanParam(name: 'IsAdmin', defaultValue: false, description: 'Are you an admin?')
        choice(name: 'Environment', choices: ['Development', 'Staging', 'Production'], description: 'Select the environment')
        text(name: 'Description', defaultValue: 'This is a sample description.', description: 'Enter a description')
    }
    stages {
        stage('Parameter print') {
            steps {
                sh 'echo "Hello, ${Name}!"'
            }
        }
        stage('Password print') {
            steps {
                sh 'echo "Your password is: ${Password}"'

            }
        }
        stage('Admin check') {
            steps {
                script {
                    if (IsAdmin) {
                        sh 'echo "You are an admin."'
                    } else {
                        sh 'echo "You are not an admin."'
                    }
                }
            }
        }
        stage('Environment print') {
            steps {
                sh 'echo "Selected environment: ${Environment}"'
            }
        }
        stage('Description print') {
            steps {
                sh 'echo "Description: ${Description}"'
            }
        }
    }
}


# TYPES OF PARAMETERS USED 

Parameter Type        Description
string.               A single-line text input parameter.
password.             A single-line text input parameter that masks the input for security purposes.
booleanParam.         A checkbox parameter that allows users to select true or false.
choice.               A dropdown parameter that allows users to select from a predefined list of options.
text.                 A multi-line text input parameter for longer descriptions or notes.