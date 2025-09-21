pipeline {
    agent { 
        node {
            label 'docker-agent-python'
            }   
      }
    triggers {
        pollSCM 'H/5 * * * *'
    } 
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                cd myapp
                    python3 -m venv /path/to/venv
                    . /path/to/venv/bin/activate
                     pip install requirements.txt
                     deactivate
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                cd myapp
                python3 helloworld.py --name Jenkins
                python3 helloworld.py
                python3 -m unittest discover -s tests -p '*_test.py'
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
    }
}