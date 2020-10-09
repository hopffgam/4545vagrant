#!/bin/bash

# Create database and user
# TODO: pull this password out of the settings file.
sudo -u postgres psql -c "CREATE USER heltour_lichess4545 WITH PASSWORD 'sown shuts combiner chattels';"
sudo -u postgres createdb -O heltour_lichess4545 heltour_lichess4545

# Ensure we can connect easily without a password
touch /home/vagrant/.pgpass
chmod 0600 /home/vagrant/.pgpass
echo "localhost:*:heltour_lichess4545:heltour_lichess4545:sown shuts combiner chattels" > /home/vagrant/.pgpass

cd /home/vagrant/
# Setup virtualenv for heltour
virtualenv heltour-env --no-site-packages --prompt="(heltour):" --python=/usr/bin/python3.6
source /home/vagrant/heltour-env/bin/activate
cd /home/vagrant/heltour
pip install -r requirements.txt
fab update
fab -R vagrant latestdb
