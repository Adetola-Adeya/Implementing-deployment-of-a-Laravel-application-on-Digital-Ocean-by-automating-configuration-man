sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql

sudo -i -u postgres psql -c "CREATE DATABASE detolaexam"
sudo -i -u postgres psql -c "CREATE userdetola WITH PASSWORD 'detolapassword';"
sudo -i -u postgres psql -c "ALTER ROLE userdetola SET CLIENT_ENCODING TO 'UTF8';"
sudo -i -u postgres psql -c "ALTER ROLE userdetola SET TIME ZONE 'Africa/Lagos';"
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE datolaexam TO userdetola;"
sudo -i -u postgres psql -c "FLUSH PRIVILEGES;"
sudo systemctl restart postgresql
