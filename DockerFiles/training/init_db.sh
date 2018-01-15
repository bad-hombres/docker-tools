#!/bin/bash

# Initialize MySQL database.
# ADD this file into the container via Dockerfile.
# Assuming you specify a VOLUME ["/var/lib/mysql"] or `-v /var/lib/mysql` on the `docker run` command…
# Once built, do e.g. `docker run your_image /path/to/docker-mysql-initialize.sh`
# Again, make sure MySQL is persisting data outside the container for this to have any effect.

set -e
set -x

mysql_install_db

# Start the MySQL daemon in the background.
/usr/sbin/mysqld &
mysql_pid=$!

until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

mysql -u root -e "CREATE DATABASE admin;"

export QUERY_STRING="action=do"; cd /var/www/html/admin/setup && php -e -r 'parse_str($_SERVER["QUERY_STRING"], $_GET); include "index.php";'

# Tell the MySQL daemon to shutdown.
mysqladmin shutdown

# Wait for the MySQL daemon to exit.
wait $mysql_pid

# create a tar file with the database as it currently exists
tar czvf default_mysql.tar.gz /var/lib/mysql


