<!--
*** README file based on this template: https://github.com/othneildrew/Best-README-Template
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Fonfon02/Module141">
    <img src="pictures/logo.png" alt="Logo" width="128" height="128">
  </a>

  <h3 align="center">Module 141</h3>

  <p align="center">
    Repo who contains files for the "Module 141"
    <br />
    <a href="https://github.com/Fonfon02/Module141/blob/master/documentation.md"><strong>Explore the documentation »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Fonfon02/Module141/issues">Report Mistake</a>
    ·
    <a href="https://github.com/Fonfon02/Module141/issues">Request Topic</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#scripts-languages">Scripts languages</li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#topics-covered">Topics covered</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#disclaimer">Disclaimer</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This repo contain our project for the module 141. It's the project of [David Araujo](https://github.com/divad1701) and [Colin Fontanellaz](https://github.com/Fonfon02).

On this repo you'll find:
  - Scripts
  - Documentation
  - Database template file



### Scripts languages

* [Bash](https://www.gnu.org/software/bash/)
* [Python](https://www.python.org)



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

During all our work, we used **Ubuntu server**. So we recommend to use the same OS or at least a Debian based one.

List of things to get to test our scripts:
  - A Mariadb server
    - File [.my.cnf](https://www.tecmint.com/connect-to-mysql-without-root-password/) configured
      Example of .my.cnf file
      ```
      [mysql]
      user=root
      password=yourpwd
  
      [mysqldump]
      user=root
      password=yourpwd
      ```
  - A PostgreSQL server
  - A MongoDB server

  To install these service just check the [documentation](documentation.md#install-mariadb).

### Installation

To use this repo you can:

Clone the repo
   ```bash
   git clone https://github.com/Fonfon02/Module141.git
   ```

or

Download this project as Zip on your local machine and decompress it
   ```bash
   wget https://github.com/Fonfon02/Module141/archive/refs/heads/master.zip

   unzip master.zip
   # or
   7z e master.zip
   ```



<!-- Topics covered -->
## Topics covered
- [Backup and restore DBs](scripts/backup_restore.sh)
- [User creation](scripts/user_privileges.sh)
- [User give privileges](scripts/user_privileges.sh)
- [User revoke access](scripts/user_privileges.sh)
- [Test requests]()
- [Crash the db with cross join]()
- [Install MariaDB](documentation.md#install-mariadb)
- [Install PostgreSql](documentation.md#install-postgresql)
- [Install MongoDB](documentation.md#install-mongodb)
- [Mariadb versus Mysql](documentation.md#mariadb-vs-mysql)
- [Postgres versus Mysql](documentation.md#postgresql-vs-mysql)
- [Phpmyadmin versus Adminer](documentation.md#phpmyadmin-vs-adminer)
- [Create Json fake data](documentation.md#generate-random-json)
- [Escape specials characters](documentation.md#escape-specials-characters-in-json)
- [LaTeX in MongoD](documentation.md#insert-latex-in-mongodb-database)
- [Referential integrity, foreign keys, etc...](documentation.md#referential-integrity)
- [Try blackhole and csv engines](documentation.md#change-the-engines-table-or-set-it-at-the-creation)



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/Fonfon02/Module141/issues) for a list of future topics.



<!-- DISCLAIMER -->
## Disclaimer

:warning: A great part of our scripts and examples use the **root** account. Obviously this is not a good practice in a production system, we only use it because all this project is a test and because it's simplier too.



<!-- CONTACT -->
## Contact

[Colin Fontanellaz](https://github.com/Fonfon02) & [David Araujo](https://github.com/divad1701)

Project Link: [https://github.com/Fonfon02/Module141](https://github.com/Fonfon02/Module141)



<!-- MARKDOWN LINKS & IMAGES -->

<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
<!-- Logo Author -->
<!-- https://www.flaticon.com/authors/phatplus -->
[contributors-shield]: https://img.shields.io/github/contributors/Fonfon02/Module141.svg?style=for-the-badge
[contributors-url]: https://github.com/Fonfon02/Module141/graphs/contributors
[issues-shield]: https://img.shields.io/github/issues/Fonfon02/Module141.svg?style=for-the-badge
[issues-url]: https://github.com/Fonfon02/Module141/issues
