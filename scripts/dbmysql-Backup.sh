#!/bin/bash

## That's a script used to backup mysql db

# Based on the work of tleish --> https://gist.github.com/tleish/1c6e788c84f59200446b

# !!! Dependencies !!!
# Be sure that the file ~/.mysql/mysqldump.cnf exists with the credentials

# Uncompress the backup
# tar -xvf [backupfile].tar
# gzip -d [backupfile].sql.gz
# [backupfile.sql] | mysql --defaults-extra-file=~/.mysql/mysqldump.cnf [dbname]

# Don't backup databases with these names
# Example: starts with mysql (^mysql) or ends with _schema (_schema$)
IGNORE_DB="(^mysql|_schema$)"

#==============================================================================
# METHODS
#==============================================================================

function database_list() {
  local show_databases_sql="SHOW DATABASES WHERE \`Database\` NOT REGEXP '$IGNORE_DB'"
  echo $(mysql --defaults-extra-file=~/.mysql/mysqldump.cnf -e "$show_databases_sql"|awk -F " " '{if (NR!=1) print $1}')
}

function echo_status(){
  printf '\r'; 
  printf ' %0.s' {0..100} 
  printf '\r'; 
  printf "$1"'\r'
}

function backup_database(){
    backup_file="$BKPFOLDER/$database.sql.gz" 
    output+="$database => $backup_file\n"
    echo_status "...backing up $count of $total databases: $database"
    $(mysqldump --defaults-extra-file=~/.mysql/mysqldump.cnf --log-error=/var/log/mysqldump_error.log --single-transaction -B $database | gzip --rsyncable -9 > $backup_file) 
}

function backup_databases(){
  local databases=$(database_list) || return 1
  local total=$(echo $databases | wc -w | xargs) || return 1
  local output=""
  local count=1

  for database in $databases; do
    backup_database || return 1
    echo $database
    local count=$((count+1))
  done
  echo -ne $output | column -t
}

#==============================================================================
# RUN SCRIPT
#==============================================================================

# Backup databases
backup_databases
tar -cf $BKPFOLDER/$BKP_FILE $BKPFOLDER/* --remove-files
if [ $? -ne 0 ]; then
  # Backup failed
  printf "[ERROR] Dumping data\n"
  # Print error
  printf "Finished with error\n"
  exit 1
fi