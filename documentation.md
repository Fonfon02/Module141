# Documentation

## Install MariaDB
```bash
# Update package index
sudo apt update

# Install MariaDB
sudo apt install mariadb-server

# Check if MariaDB is installed and running
systemctl status mariadb

# Run the sudo secure installation (not very useful in a lab like this one)
sudo mysql_secure_installation
```

## Install PostgreSql
```bash
# Update package index
sudo apt update

# Install packages
sudo apt install postgresql postgresql-contrib

# Test to login with postgres' user
sudo -i -u postgres
exit
```
If everything is fine, we can create a new user (or role)
```bash
# Create a new user on postgres
sudo -u postgres createuser --interactive
Enter name of role to add: test
Shall the new role be a superuser? (y/n) y

# Create a new user on your linux too
sudo adduser test

# Create a new database
sudo -u postgres createdb test # Use the same name for your db and for your user. By default a user will attempt to connect to a db who is called like him.

# Test your user and your db
sudo -i -u test
psql
psql -d postgres # Or you can specify a database to connect.
```

### Links
  - https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart

## Install MongoDB
```bash
# Install gnupg
sudo apt install gnupg

# Import the MongoDB public GPG Key
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# Create list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Update package index and install mongodb-org
sudo apt update
sudo apt install mongodb-org

# Start and enable at boot MongoDB
sudo systemctl start mongod
sudo systemctl enable mongod

# Test your installation
sudo systemctl status mongod
mongo
```

### Links
  - https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

## MariaDb vs MySql 
MariaDb is a fork of MySql but there's some differences between them.

### Comparison 
  - Mariadb is released under GPL, LGPL or BSD license. It's more opensource than MySql. 
  - Mariadb have more storage engines.
  - Mariadb has speed improvements.
  - They manage thread pools in a different way.

### Links
  - https://kinsta.com/blog/mariadb-vs-mysql/
  - https://mariadb.com/kb/en/mariadb-vs-mysql-features/

## PostgreSql vs MySql
### Comparison 
The main difference between Postgres and MySql is that the first is an object-relational database and the second a relational database.

  - MySql is simpler, that's easy and fast to set up and it's very known.

  - Postgres is a feature-rich database. Which means that it can handle very complex queries and big database. So, basically, it's more complicated than Mysql.

### Links
  - https://www.xplenty.com/blog/postgresql-vs-mysql-which-one-is-better-for-your-use-case/
  - https://developer.okta.com/blog/2019/07/19/mysql-vs-postgres

## Phpmyadmin vs Adminer
### What are Phpmyadmin and Adminer?
They are both web administration tools for databases. They are used to manage databases, are written in PHP and can be installed on a server and accessed from a web browser.

They provide a GUI to manage databases.

### Comparison 
I will just compare the points I find (personally) important. I'll let you do your own research and your own opinion.

Phpmyadmin's Advantages:
  - More known and used than Adminer, it's easier to get help with it (with forums for example)
  - There are more possibilities to export databases (LaTex, MediaWiki Table, ...)

Adminer's Advantages:
  - Supports more databases types (MySql, SQLite, PostgreSql, MSSql, Oracle db)
  - The install is lighter than Phpmyadmin and is only found in a single file
  - No need to configure it, it'll just work

### Links
  - https://www.adminer.org/en/phpmyadmin/
    - !! Be careful about this link because that's a critic about adminer and phpmyadmin but made by the adminer devloppers.
  - https://www.wpoven.com/blog/adminer-vs-phpmyadmin/

## Json
### Generate Random Json
To test the insert of json data in our DBs I used [JSONPlaceholder](https://jsonplaceholder.typicode.com). I made a simple script (cf. script folder) who ask the JSONPlaceholder API and return some random data for tests. Depending what you need you can choose between 6 type of data:
  - Post
    ~~~json
    {
        "userId": 1,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    }
    ~~~
  - Comments
    ~~~json
    {
        "postId": 1,
        "id": 1,
        "name": "id labore ex et quam laborum",
        "email": "Eliseo@gardner.biz",
        "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
    }
    ~~~
  - Albums
    ~~~json
    {
        "userId": 1,
        "id": 1,
        "title": "quidem molestiae enim"
    }
    ~~~
  - Photos
    ~~~json
    {
        "albumId": 1,
        "id": 1,
        "title": "accusamus beatae ad facilis cum similique qui sunt",
        "url": "https://via.placeholder.com/600/92c952",
        "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    }
    ~~~
  - Todos
    ~~~json
    {
        "userId": 1,
        "id": 1,
        "title": "delectus aut autem",
        "completed": false
    }
    ~~~
  - Users
    ~~~json
    {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
            "street": "Kulas Light",
            "suite": "Apt. 556",
            "city": "Gwenborough",
            "zipcode": "92998-3874",
            "geo": {
                "lat": "-37.3159",
                "lng": "81.1496"
            }
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
            "name": "Romaguera-Crona",
            "catchPhrase": "Multi-layered client-server neural-net",
            "bs": "harness real-time e-markets"
        }
    }
    ~~~


Obviously you can use a website to create random data too, I found one who is cool and simple to use. Just check the links below. If you have to create only one or two fake data it will be practical.

### Links
  - https://www.json-generator.com
  - https://jsonplaceholder.typicode.com

### Escape specials characters in Json
There's several ways to escape specials char into json. You can use a [website](https://www.freeformatter.com/json-escape.html), or just use python for example.

I found the project [escapejson](https://pypi.org/project/escapejson/) for python. The goal of this project is to avoid cross-site scripting attack. So it's mainly used with Django,anyway, you can use it to insert data with json formata.

Obviously other languages have methods to get the same result, like powershell for example:
~~~~powershell
$i = "Notepad++"
$i_escaped = [Regex]::Escape($i)
~~~~

### Links
  - https://www.freeformatter.com/json-escape.html
  - https://pypi.org/project/escapejson/

## Insert LaTeX in MongoDB database
To do this I just created a json file with the data:
~~~json
[
{
    "_id" : 1,
    "data": "\\begin{document} *************************************************************************************** QUESTION : \\question[3] ATTENTION~: La source de tension $U_1$ est inversée. Quelles sont les conditions pour que les deux diodes soient conductrices~?  ******************************************************************************************** REPONSE : \\begin{solution} \\begin{circuitikz}[european,thick,voltage shift=0.3] %    \\draw[OMdeYLB] (-5,-5) grid (10,10); \\coordinate (I) at (-5,4); \\coordinate (J) at (-4,4); \\coordinate (K) at (-3,0); \\coordinate (L) at (0,0); \\node (amb) [right] at (6,2.5) {$\\textbf{B}$}; \\draw (6,2.5) to[Do, v_<=$U_{R_{CB}}$,l^=$R_{CB}$,o-o] (6,5) node[right] {$\\textbf{C}$}; \\draw (6,2.5) to[Do, l_=$R_{BE}$,o-o] (6,0) node[right] {$\\textbf{E}$}; \\draw (4,2.5) to[short, -o] (6,2.5); \\node[above] at (4,2.5) {$\\textbf{B}$}; \\draw (4,2.5) node[ocirc]{}; \\draw (0,0) to[short, -o] (6,0); \\draw ([xshift=0pt,yshift=0pt]8,-0.5)  to [open, v_<=$U_{CE}$] ([xshift=0pt,yshift=0pt]8,5.5); % Tension U BE \\draw ([xshift=-7pt,yshift=8pt]4,2)  to [open, v_>=$U_{BE}$] ([xshift=-7pt,yshift=-3pt]5.5,0); \\draw (0,2.5) node[yshift=-20pt,right]{$+$} to[V] (0,0) node[yshift=20pt,right]{$-$}; \\draw ([xshift=-5pt,yshift=0pt]-0.5,0) to [open, v^<=$U_{1}$] ([xshift=-5pt,yshift=0pt]-0.5,2.5); \\ctikzset{current/distance = -1.1} \\draw (0,2.5) to[R, v_>=$U_{R_{B}}$,l^=$R_{B}$,i=$I_B$,-o] (4,2.5) node[right] {$\\textbf{}$}; \\end{circuitikz} \\end{solution} \\end{document}"
}
]
~~~

And I just had to import it in MongoDB:
```bash
mongoimport --jsonArray --db test --collection latex --file latex.json
# Obviously db "test" and collection "latex" have to exist in your MongoDB instance
```

By the way, to solve issue about the backslash chararacters during the import, I just use this vim command:
```
:%s/\\/\\\\/g
```

It basically escapes backslashes with backslashes.

![alt text]( ./pictures/backslashes.png "Backslash meme")

### Links
  - https://stackoverflow.com/questions/19441228/insert-json-file-into-mongodb 
  - https://xkcd.com/1638/

## Referential integrity
Referential integrity is a state in which each information in a table A is linked to another in a table B. It allows the consistency of the database content.

To implement referential integrity, we use a foreign key. To create a foreign key between two tables, there are two conditions:

1. Both tables must work with the innoDB engine.
2. The fields used must be indexed and under the same data type.

Example:

In our database, we have a customer order from a customer. The referential integrity will prohibit to delete the customer as long as there is a customer order of this customer in the database. And in the same way, it will prohibit to create a customer order from this customer if it does not already exist in the database.

![alt text]( ./pictures/example.png "Example referential integrity")

### Links
  - https://www.techrepublic.com/article/an-introduction-to-foreign-keys-and-referential-integrity-in-mysql/#:~:text=Referential%20integrity%20is%20an%20important,that%20make%20up%20the%20system.
  - https://fr.wikipedia.org/wiki/Intégrité_référentielle#:~:text=En%20informatique%2C%20et%20plus%20particulièrement,existe%20dans%20la%20table%20B.
  - https://www.sqlshack.com/wp-content/uploads/2020/02/foreign-key-data-matching-illustration.png

## Commands list
### Mysql useful commands
#### Change the engine's table or set it at the creation
~~~~sql
ALTER TABLE $TABLE ENGINE = CSV;
ALTER TABLE $TABLE ENGINE = BLACKHOLE;
CREATE TABLE test(i INT, c CHAR(10)) ENGINE = CSV;
CREATE TABLE test(i INT, c CHAR(10)) ENGINE = BLACKHOLE;
~~~~

#### Show infos about databases and tables
~~~~sql
SHOW DATABASES;
DROP DATABASE;
USE $DB;
SELECT * FROM $TABLE;
SHOW COLUMNS FROM $TABLE;
SHOW INDEX FROM $TABLE;
~~~~

#### Show infos about user
~~~~sql
SELECT User,Host FROM mysql.user;
SHOW GRANTS FOR '$USER'@'localhost';
~~~~

#### Transactions commands
~~~~sql
SET autocommit = ON;
SET autocommit = OFF;
~~~~

#### Get information schema infos
~~~~sql
SELECT TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS;
SHOW TABLE STATUS where name like '$TABLE';
SELECT TABLE_SCHEMA, TABLE_NAME, TABLE_COLLATION FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = '$TABLE';
SELECT * FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_NAME = '$TABLE';
~~~~

### Bash useful commands
```bash
mysql -e '$MYSQL_COMMAND'
mysqldump -u $USER -p $DB
mysqldump -u $USER -p $DB > $FILE.sql
```
### MongoDB useful commands
#### Create, list, drop DB
~~~~sql
use test
db
show dbs
db.dropDatabase()
~~~~

#### Create, list, insert, remove, drop Collection
~~~~sql
use test
db.createCollection("testcollection")
show collections
db.testcollection.insert(data)
db.testcollection.insertOne(data)
db.testcollection.insertMany(data)
db.testcollection.remove({"gender":"male"})
db.testcollection.drop()
~~~~

#### Queries
~~~~sql
db.testcollection.find().pretty()
db.testcollection.findOne({"_id": 846})
db.testcollection.find({$and:[{"gender":"male"},{"_id": 846}]}).pretty()
db.testcollection.find({$or:[{"age": 21},{"_id": 846}]}).pretty()
~~~~

### Links
  - https://www.tutorialspoint.com/mongodb/