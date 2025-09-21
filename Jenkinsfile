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
                        
                        // Activate the virtual environment
                        // Install dependencies from requirements.txt
                        sh 'whoami'
                        sh '''
                        python3 --version
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