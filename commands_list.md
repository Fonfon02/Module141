# Commands list
## Change the engine's table or set it at the creation
~~~~sql
ALTER TABLE $TABLE ENGINE = CSV;
ALTER TABLE $TABLE ENGINE = BLACKHOLE;
CREATE TABLE test(i INT, c CHAR(10)) ENGINE = CSV;
CREATE TABLE test(i INT, c CHAR(10)) ENGINE = BLACKHOLE;
~~~~

## Mysql useful commands
~~~~sql
SHOW DATABASES;
DROP DATABASE;
USE $DB;
SHOW TABLES;
SELECT * FROM $TABLE;
SHOW COLUMNS FROM $TABLE;
SHOW INDEX FROM $TABLE;
~~~~

## Bash useful commands
```bash
mysql -e '$MYSQL_COMMAND'
mysqldump -u $USER -p $DB
mysqldump -u $USER -p $DB > $FILE.sql
```