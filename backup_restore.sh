#!/bin/bash

# This script will:
# - Create all databases (number choosed with the db_number variable)
# - Insert datas in databases
# - Dump databases
# - Recreate dbs
# - Restore dbs
# - Delete all files  (can be set with the delete_files variable)

user="root"
current_date=`date +%F_%H%M%S`
db_number="1 2 3"
delete_files="true"

for i in $db_numbers;do
  # Recreate databases (this code is commented in the sql file)
  mysql -u $user -e "DROP DATABASE IF EXISTS db104_$i;"
  mysql -u $user -e "CREATE DATABASE IF NOT EXISTS db104_$i;"
  
  # Create sql files (copy template)
  cp ./databases/db104_template.sql ./databases/db104_$i.sql

  # Insert data into databases
  mysql -u $user -p db104_$i < ./databases/db104_$i.sql
  
  # Dump databases
  mysqldump -u $user -p db104_$i > ./databases/dumps/dump_db104_$i_$current_date.sql
  
  # Recreate dbs (already in the dump file)
  mysql -u $user -e "CREATE DATABASE db104_$i;"
  mysql -u $user -e "DROP DATABASE db104_$i;"
  
  ### Restore databases
  mysql -u $user -p db104_$i < dump_db104_$i_$current_date.sql
done

# Delete all the files
if [delete_files -eq "true"];then
  for i in $db_numbers;do
    rm ./databases/db104_$i.sql
    rm ./databases/dumps/dump_db104_$i_$current_date.sql
  done
fi
