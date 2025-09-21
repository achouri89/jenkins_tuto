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
        stage('Setup Python Virtual Environment') {
            steps {
                script {
                    echo "Setting up Python Virtual Environment.."
                    // Navigate to the project directory
                    //cd myapp
                    sh 'cd myapp && python3 -m venv venv && . venv/bin/activate && pip install fire'
                    // Create a virtual environment
                    //sh 'python3 -m venv venv'
                    // Activate the virtual environment and install dependencies

                    //sh '''
                    //    python3 -m venv /myapp/venv
                    //    . /myapp/venv/bin/activate
                    //    pip3 install fire
                    //'''
                
                }
            }
        }
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                cd myapp
                python3 helloworld.py --name Achouri
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