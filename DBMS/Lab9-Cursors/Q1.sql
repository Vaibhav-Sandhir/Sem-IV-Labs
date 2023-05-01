DROP TABLE salary_raise;

CREATE TABLE salary_raise (
    inst_id NUMERIC(10),
    raise_date DATE,
    raise_amt NUMERIC(10)
);

SET SERVEROUTPUT ON

DECLARE 
    CURSOR C(dname instructor.dept_name%TYPE) IS SELECT * FROM instructor WHERE dept_name = dname;
    pl_dept_name instructor.dept_name%TYPE;
    inst_row instructor%ROWTYPE;

BEGIN 
    pl_dept_name := '&Dept_Name';
    OPEN C(pl_dept_name);
    LOOP
        FETCH C INTO inst_row;
        EXIT WHEN C%NOTFOUND;
        UPDATE instructor SET salary = salary * 1.05
        WHERE ID = inst_row.ID;
        INSERT INTO salary_raise VALUES(inst_row.ID,SYSDATE,inst_row.salary * 0.05);
    END LOOP;
    CLOSE C;
END;
/   

SELECT * FROM salary_raise;
