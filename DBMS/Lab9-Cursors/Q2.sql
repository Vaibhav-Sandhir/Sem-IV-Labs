SET SERVEROUTPUT ON

DECLARE 
    CURSOR C IS SELECT * FROM student ORDER BY tot_cred ASC;
    stu student%ROWTYPE;
    i NUMBER(2) := 1;

BEGIN
    OPEN C;
    WHILE i <= 10 LOOP  
        FETCH C INTO stu;
        DBMS_OUTPUT.PUT_LINE('ID: ' || stu.ID);
        DBMS_OUTPUT.PUT_LINE('Credits: ' || stu.tot_cred);
        i := i + 1;
    END LOOP;
    CLOSE C;
END;
/                