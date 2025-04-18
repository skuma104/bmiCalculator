# Run with: source activate.sh

if [ ! -d venv ]; then
    python3 -m venv venv
fi

if [ -z ${VIRTUAL_ENV} ]; then 
    source ./venv/bin/activate
fi
if [ -z ${VIRTUAL_ENV} ]; then 
    exit 1
fi

# checking required packages
python3 -m pip --require-virtualenv install -q --upgrade pip
python3 -m pip --require-virtualenv install -q -r requirements.txt

# Add java to the path
if [[ ":$PATH:" != *"/usr/local/opt/openjdk/bin/:"* ]]; then
  export PATH="/usr/local/opt/openjdk/bin/:$PATH"
fi
