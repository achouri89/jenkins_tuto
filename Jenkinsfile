pipeline {
    agent any  // or specify a custom agent like 'docker'

    environment {
        VIRTUAL_ENV_PATH = 'myapp/venv'  // Relative path to the virtual environment
        REQUIREMENTS_FILE = 'myapp/requirements.txt'  // Relative path to the requirements.txt file
    }

    stages {

        stage('install dependencies') {
            steps {
                script {
                    // Create virtual environment if it doesn't exist
                    if (!fileExists(VIRTUAL_ENV_PATH)) {
                        sh "python3 -m venv ${VIRTUAL_ENV_PATH}"
                    }
                    // Activate virtual environment and install dependencies
                    sh """
                        pwd
                        source ${VIRTUAL_ENV_PATH}/bin/activate
                        pip install --upgrade pip
                        pip install -r ${REQUIREMENTS_FILE}
                    """
                }
            }
        }
    }
}