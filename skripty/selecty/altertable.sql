#--https://www.mysqltutorial.org/mysql-add-column/
ALTER TABLE vendors
ADD COLUMN phone VARCHAR(15) AFTER name;

