#!/bin/bash

# This script will:
# - Creation of user
# - Give privileges to the user 
# - Test requests
# - Revoke access to the user
# - Remove created user

user="root"
user_test="user1"

# Create or recreate database
printf "Create database test_user\n"
mysql -u $user -e "DROP DATABASE IF EXISTS test_user;"
mysql -u $user -e "CREATE DATABASE IF NOT EXISTS test_user;"

# Create the user
printf "Create the $user_test\n"
mysql -u $user -e "CREATE USER '$user_test'@'localhost' IDENTIFIED BY 'pwd';"

# Give privilege to the user
printf "Give privileges on database\n"
mysql -v -u $user -e "GRANT CREATE ON test_user.* TO '$user_test'@'localhost';"
mysql -v -u $user -e "GRANT DROP ON test_user.* TO '$user_test'@'localhost';"

# Reload privileges
mysql -v -u $user -e "FLUSH PRIVILEGES;"

# Do a request
printf "Do some requests\n"
mysql -v -u $user_test -ppwd -e "CREATE TABLE test_user.test(i INT, c CHAR(10))"
mysql -v -u $user_test -ppwd -e "DROP TABLE test_user.test"

# Revoke privilege to the user
printf "Revoke privileges on database\n"
mysql -v -u $user -e "REVOKE CREATE ON test_user.* FROM '$user_test'@'localhost';"
mysql -v -u $user -e "REVOKE DROP ON test_user.* FROM '$user_test'@'localhost';"

# Reload privileges
mysql -v -u $user -e "FLUSH PRIVILEGES;"

# Drop database and user
printf "Drop the database and the user\n"
mysql -u $user -e "DROP DATABASE test_user;"
mysql -u $user -e "DROP USER '$user_test'@'localhost';"