mysql -u root
create database cms;
use cms;


--vytvori dump, neprihlasuj sa ale priamo z cmd
https://linuxize.com/post/how-to-back-up-and-restore-mysql-databases-with-mysqldump/
mysqldump -u root -p database_name > database_name.sql

--nahra mysql dump
source < cms.sql;