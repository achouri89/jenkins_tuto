pipeline {
    agent any  // or specify a custom agent like 'docker'

    environment {
        VIRTUAL_ENV_PATH = 'myapp/venv'  // Relative path to the virtual environment
        REQUIREMENTS_FILE = 'myapp/requirements.txt'  // Relative path to the requirements.txt file
    }

    stages {
        stage('Set up Virtual Environment') {
            steps {
                script {
                    // Running shell script as before
                    sh '''
                    pwd
                    ls -la
                    '''
                    sh '''
                    #!/bin/bash

                    # Activate the virtual environment
                    source $VIRTUAL_ENV_PATH/bin/activate

                    # Check if the virtual environment was activated
                    if [ -z "$VIRTUAL_ENV" ]; then
                        echo "Virtual environment not activated!"
                        exit 1
                    fi

                    # Install requirements from requirements.txt
                    if [ -f "$REQUIREMENTS_FILE" ]; then
                        echo "Installing dependencies from requirements.txt..."
                        pip install -r $REQUIREMENTS_FILE
                    else
                        echo "requirements.txt not found!"
                        exit 1
                    fi

                    # Optionally, deactivate the virtual environment after installation
                    deactivate
                    '''
                }
            }
        }
    }
}