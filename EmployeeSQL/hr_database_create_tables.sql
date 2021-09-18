-- This module is to CREATE tables, add FOREIGN KEYs
-- It's also to remove FOREIGN KEY constraints and DELETE tables if necessary

-- Create tables if needed
CREATE TABLE "departments" (
    "dept_no" VARCHAR NOT NULL,
    "dept_name" VARCHAR NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int NOT NULL,
    "emp_title_id" VARCHAR NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" VARCHAR NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR NOT NULL,
    "title" VARCHAR NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

---------------------------------------------------------------------------------------------

-- Add foreign key constraints
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

_____________________________________________________________________________________________________________________

-- Remove constraints in order to be able to drop tables
ALTER TABLE employees 
  DROP CONSTRAINT IF EXISTS fk_employees_emp_title_id;

ALTER TABLE dept_manager 
  DROP CONSTRAINT IF EXISTS fk_dept_manager_dept_no;

ALTER TABLE dept_manager 
  DROP CONSTRAINT IF EXISTS fk_dept_manager_emp_no;
 
ALTER TABLE dept_emp 
  DROP CONSTRAINT IF EXISTS fk_dept_emp_dept_no;

ALTER TABLE dept_emp 
  DROP CONSTRAINT IF EXISTS fk_dept_emp_emp_no;

ALTER TABLE salaries 
  DROP CONSTRAINT IF EXISTS fk_salaries_emp_no;

-----------------------------------------------------------------------------------------------------

-- Drop tables if needed
DROP TABLE IF EXISTS "titles";
DROP TABLE IF EXISTS "salaries";
DROP TABLE IF EXISTS "employees";
DROP TABLE IF EXISTS "dept_manager";
DROP TABLE IF EXISTS "dept_emp";
DROP TABLE IF EXISTS "departments";