

DROP TABLE IF EXISTS TITLES;
DROP TABLE IF EXISTS SALARIES;
DROP TABLE IF EXISTS EMPLOYEES;
DROP TABLE IF EXISTS DEPT_EMP;
DROP TABLE IF EXISTS DEPT_MANAGER;
DROP TABLE IF EXISTS DEPARTMENTS;

---------------------------------------------------------------------------------------------

CREATE TABLE TITLES
(
TITLE_ID VARCHAR(50) PRIMARY KEY,
TITLE	VARCHAR(50)
)
;
CREATE TABLE SALARIES
(
EMP_NO INTEGER PRIMARY KEY,
SALARY	INTEGER
)
;

CREATE TABLE EMPLOYEES
(
EMP_NO INTEGER PRIMARY KEY,
EMP_TITLE_ID VARCHAR(50),
BIRTH_DATE	DATE,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
SEX VARCHAR(1),
HIRE_DATE DATE
)
;
CREATE TABLE DEPT_EMP
(
EMP_NO INTEGER,
DEPT_NO VARCHAR (50)
	
)
;

CREATE TABLE DEPARTMENTS
(
DEPT_NO VARCHAR PRIMARY KEY,
DEPT_NAME VARCHAR
)
;
CREATE TABLE DEPT_MANAGER
(
EMP_NO INTEGER PRIMARY KEY,
DEPT_NO VARCHAR(20)
)
;

--  FOREIGN KEYS 

-- EMPLOYEES.EMP_TITLE_ID => TITLES.TITLE_ID

-- EMPLOYEES.EMP_NO => DEPT_EMP.EMP_NO

-- DEPT_EMP.DEPT_NO => DEPARTMENTS => DETP_NO

-- DEPARTMENTS.DEPT_NO => DEPT_MANAGER.DEPT_NO

-------------------------------------------------------------------------------------

ALTER TABLE employees 
  DROP CONSTRAINT IF EXISTS titles;
  
ALTER TABLE dept_manager 
  DROP CONSTRAINT IF EXISTS department;
  
ALTER TABLE dept_emp 
  DROP CONSTRAINT IF EXISTS department2;
  ALTER TABLE dept_emp 
  DROP CONSTRAINT IF EXISTS employee_number1;
ALTER TABLE dept_manager 
  DROP CONSTRAINT IF EXISTS employee_number2;
  
ALTER TABLE salaries 
  DROP CONSTRAINT IF EXISTS employee_number3;

ALTER TABLE departments 
  DROP CONSTRAINT IF EXISTS employee_number3;

ALTER TABLE employees 
  DROP CONSTRAINT IF EXISTS fk_titles;
  
ALTER TABLE dept_manager 
  DROP CONSTRAINT IF EXISTS fk_department;
  
ALTER TABLE dept_emp 
  DROP CONSTRAINT IF EXISTS fk_department2;
  ALTER TABLE dept_emp 
  DROP CONSTRAINT IF EXISTS fk_employee_number1;
  
ALTER TABLE dept_manager 
  DROP CONSTRAINT IF EXISTS fk_employee_number2;
  
ALTER TABLE salaries 
  DROP CONSTRAINT IF EXISTS fk_employee_number3;

------------------------------------------------------------------------------

ALTER TABLE "employees"
ADD CONSTRAINT "fk_titles"
FOREIGN KEY (emp_title_id)
REFERENCES "titles" (title_id);

ALTER TABLE "dept_manager"
ADD CONSTRAINT "fk_department1"
FOREIGN KEY (dept_no)
REFERENCES "departments" (dept_no);
-- departments to department employee relationship


ALTER TABLE "dept_emp"
ADD CONSTRAINT "fk_department2"
FOREIGN KEY (dept_no)
REFERENCES "departments" (dept_no);
-- employees to department employee relationship
  
ALTER TABLE "dept_emp"
ADD CONSTRAINT "fk_employee_number1"
FOREIGN KEY (emp_no)
REFERENCES "employees" (emp_no);

-- employees to dept_manager relationship


ALTER TABLE "dept_manager"
ADD CONSTRAINT "fk_employee_number2"
FOREIGN KEY (emp_no)
REFERENCES "employees" (emp_no);
  

-- employees to salaries relationship
ALTER TABLE "salaries"
ADD CONSTRAINT "fk_employee_number3"
FOREIGN KEY (emp_no)
REFERENCES "employees" (emp_no);
create_tables.sql
Displaying create_tables.sql.