# Module 141

## Referential integrity

![alt text]( ./pictures/1.png "SQL meme 1")

This repo contain our project for the module 141. It's the project of [David Araujo](https://github.com/divad1701) and [Colin Fontanellaz](https://github.com/Fonfon02).

## Prerequisite
List of things to get before install:
  - A Mariadb server with root access:
    - To install it check the [official MariaDB documentation](https://www.tecmint.com/connect-to-mysql-without-root-password/)
    - Or check our installation guide under documentation.md

  - File [.my.cnf](https://www.tecmint.com/connect-to-mysql-without-root-password/) configured (in this tutorial we are going to use root account for scripts)
    Example of .my.cnf file
    ```bash
    [mysql]
    user=root
    password=yourpwd
  
    [mysqldump]
    user=root
    password=yourpwd
    ```
## Installation 
![alt text]( ./pictures/2.jpg "SQL meme 2")

To use this repo you have to:
  - Clone or import this project as Zip on your local machine
  - Decompress the project in a directory

## Content
This repo contains all the work asked for the Module 141:
  - Scripts
  - Database template file
  - Documentation

## Topics covered
- Backup and restore a DB
- Backup and restore three DBs
- Try blackhole and csv engines
- User creation
- Give privileges to users 
- Revoke access to users
- Test requests
- Crash the db with cross join
- Referential integrity, foreign keys, etc...
- Install MariaDB
- Install PostgreSql
- Phpmyadmin versus Adminer
