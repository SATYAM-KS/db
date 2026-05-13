SET SERVEROUTPUT ON;

CREATE TABLE Employee(
    EmpID NUMBER PRIMARY KEY,
    Name VARCHAR2(30),
    Salary NUMBER
);

INSERT ALL
    INTO Employee VALUES(1,'Rahul',30000)
    INTO Employee VALUES(2,'Amit',40000)
SELECT * FROM dual;

CREATE TABLE Employee_Audit(
    EmpID NUMBER,
    OldSalary NUMBER,
    NewSalary NUMBER
);

CREATE OR REPLACE TRIGGER Salary_Trigger
BEFORE UPDATE OF Salary
ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit
    VALUES(
        :OLD.EmpID,
        :OLD.Salary,
        :NEW.Salary
    );
END;
/

UPDATE Employee
SET Salary = 50000
WHERE EmpID = 1;

SELECT * FROM Employee_Audit;
