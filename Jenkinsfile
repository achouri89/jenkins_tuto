pipeline {
    agent any  // or specify a custom agent like 'docker'

    environment {
        VIRTUAL_ENV_PATH = '/venv'  // Relative path to the virtual environment
        REQUIREMENTS_FILE = '/requirements.txt'  // Relative path to the requirements.txt file
    }

    stages {
        stage('Setup Virtual Environment') {
            steps {
                script {
                    // Create virtual environment
                    sh "cd myapp && python3 -m venv ${env.VIRTUAL_ENV_PATH}"
            
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Activate virtual environment and install dependencies
                    sh """
                        source ${env.VIRTUAL_ENV_PATH}/bin/activate
                        pip install -r ${env.REQUIREMENTS_FILE}
                    """
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Activate virtual environment and run tests
                    sh """
                        source ${env.VIRTUAL_ENV_PATH}/bin/activate
                        pytest tests/  // Adjust the test command as needed
                    """
                }
            }
        }
    }
}