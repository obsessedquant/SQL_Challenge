-- Question 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT em.emp_no, em.last_name, em.first_name, em.sex, sa.salary
	FROM employees em
	INNER JOIN salaries sa ON
	em.emp_no = sa.emp_no

-- Question 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
	FROM employees
	WHERE date_part('year', hire_date) = 1986

-- Question 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
	FROM employees
	INNER JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
	INNER JOIN departments ON departments.dept_no = dept_manager.dept_no

-- Question 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM employees
	INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no

-- Question 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT em.first_name, em.last_name, em.sex
	FROM employees em
	WHERE em.last_name LIKE 'B%' AND em.first_name = 'Hercules'

-- Question 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT em.emp_no, em.last_name, em.first_name, dept_name
	FROM employees em
	INNER JOIN dept_emp ON dept_emp.emp_no = em.emp_no
	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
	WHERE dept_name = 'Sales'

-- Question 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT em.emp_no, em.last_name, em.first_name, dept_name
	FROM employees em
	INNER JOIN dept_emp ON dept_emp.emp_no = em.emp_no
	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
	WHERE dept_name IN ('Sales','Development')

-- Question 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) FROM employees
	GROUP BY last_name
	ORDER BY COUNT(*) DESC;
	
-- SELECT *
-- FROM pg_settings
-- WHERE name = 'port';