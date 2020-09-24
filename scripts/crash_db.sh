#!/bin/bash

# This script will:
# - Run a mysql script

user="root"
script="crash_db.sql"

# Run the script
printf "Run the script\n"
mysql -v -u $user < $script