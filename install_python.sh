docker exec -it --user root jenkins-blueocean bash

#!/bin/bash

if ! command -v python3 &> /dev/null
then
    echo "Python 3 not found. Installing Python 3..."
    apt-get update && apt-get install -y python3 python3-pip
else
    echo "Python 3 is already installed"
fi
