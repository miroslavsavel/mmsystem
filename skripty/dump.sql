mysql -u root
create database cms;
use cms;
--vytvori dump
mysqldump db_name > backup-file.sql
--nahra mysql dump
source < cms.sql;