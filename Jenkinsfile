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
                    // Navigate to the project directory (if needed)
                    dir('myapp') {
                        // Create virtual environment
                        sh 'python3 -m venv venv'
                        
                        // Activate the virtual environment
                        // Install dependencies from requirements.txt
                        sh '''
                            . venv/bin/activate
                            pip install --upgrade pip
                        '''
                        sh 'whoami'
                        sh '''
                            if [ -f requirements.txt ]; then
                                pip install -r requirements.txt
                            else
                                echo "No requirements.txt file found."
                            fi
                        '''
                    }
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