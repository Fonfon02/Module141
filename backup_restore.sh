### Create dbs (already in the sql file)
mysql -e 'CREATE DATABASE db104_1;'
mysql -e 'CREATE DATABASE db104_2;'
mysql -e 'CREATE DATABASE db104_3;'

### Insert data into databases
mysql -u root -p db104_1 < ./databases/db104_1.sql
mysql -u root -p db104_2 < ./databases/db104_2.sql
mysql -u root -p db104_3 < ./databases/db104_3.sql

### Dump databases
mysqldump -u root -p db104_1 > dump_db104_1.sql
mysqldump -u root -p db104_2 > dump_db104_2.sql
mysqldump -u root -p db104_3 > dump_db104_3.sql

### Recreate dbs (already in the dump file)
mysql -e 'CREATE DATABASE db104_1;'
mysql -e 'DROP DATABASE db104_1;'
mysql -e 'CREATE DATABASE db104_2;'
mysql -e 'DROP DATABASE db104_2;'
mysql -e 'CREATE DATABASE db104_3;'
mysql -e 'DROP DATABASE db104_3;'

### Restore databases
mysql -u root -p db104_1 < dump_db104_1.sql
mysql -u root -p db104_2 < dump_db104_2.sql
mysql -u root -p db104_3 < dump_db104_3.sql
