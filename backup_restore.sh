#!/bin/bash

# This script will:
# - Create all databases (number choosed with the db_number variable)
# - Insert datas in databases
# - Dump databases
# - Recreate dbs
# - Restore dbs
# - Delete all files  (can be set with the delete_files variable)

user="root"
delete_files="true"

for i in 1 2 3;do
  # Set variables
  current_date=`date +%F_%H%M%S`
  dump_name="${i}_${current_date}"

  # Print info
  printf "db104_$i process\n"

  # Recreate databases (this code is commented in the sql file)
  printf "Recreate databases $i\n"
  mysql -u $user -e "DROP DATABASE IF EXISTS db104_$i;"
  mysql -u $user -e "CREATE DATABASE IF NOT EXISTS db104_$i;"
  
  # Create sql files (copy template)
  printf "Create sql files $i\n"
  cp ./databases/db104_template.sql ./databases/db104_$i.sql

  # Insert data into databases
  printf "Insert data into databases    "
  mysql -u $user db104_$i < ./databases/db104_$i.sql
  printf "OK \n"
  
  # Dump databases
  printf "Dump databases    "
  mysqldump -u $user db104_$i > ./databases/dumps/dump_db104_$dump_name.sql
  printf "OK \n"
  
  # Recreate dbs (this code is commented in the sql dumps)
  printf "Recreate dbs\n"
  mysql -u $user -e "DROP DATABASE db104_$i;"
  mysql -u $user -e "CREATE DATABASE db104_$i;"
  
  ### Restore databases
  printf "Restore databases   "
  mysql -u $user db104_$i < ./databases/dumps/dump_db104_$dump_name.sql
  printf "OK \n"

  # Print info
  printf "\n"
done

# Delete all the files
if [ $delete_files == "true" ];then
  for i in 1 2 3;do
   printf "Remove files db\n"
   rm ./databases/db104_$i.sql
  done
  rm ./databases/dumps/*
fi