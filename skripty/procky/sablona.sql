CREATE PROCEDURE ROWPERROW()
BEGIN
    DECLARE n INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;

    SELECT COUNT(*) FROM table_A INTO n;

    SET i=0;
    WHILE i<n DO 
        INSERT INTO table_B(ID, VAL) SELECT (ID, VAL) FROM table_A LIMIT i,1;
        SET i = i + 1;
    END WHILE;
End;
;;

DELIMITER ;

CALL ROWPERROW();





INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...); 