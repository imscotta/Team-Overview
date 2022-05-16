--#### Data Analysis

--Once you have a complete database, perform these steps:

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salary.salary
FROM employee
INNER JOIN salary ON salary.emp_no = employee.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employee 
WHERE EXTRACT(YEAR FROM hire_date)=1986;

--3. List the manager of each department with the following information: department number, department name, the managers employee number, last name, first name.

SELECT department_manager.dept_no, department_manager.emp_no, department.dept_name, employee.last_name, employee.first_name
FROM department_manager
INNER JOIN department ON department.dept_no = department_manager.dept_no
INNER JOIN employee ON employee.emp_no = department_manager.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT department_employee.emp_no, department.dept_name, employee.last_name, employee.first_name
FROM department_employee
INNER JOIN department ON department.dept_no = department_employee.dept_no
INNER JOIN employee ON employee.emp_no = department_employee.emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex FROM employee
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT department_employee.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM department_employee
INNER JOIN employee ON employee.emp_no = department_employee.emp_no
INNER JOIN department ON department.dept_no = department_employee.dept_no
WHERE department.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT department_employee.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM department_employee
INNER JOIN employee ON employee.emp_no = department_employee.emp_no
INNER JOIN department ON department.dept_no = department_employee.dept_no
WHERE department.dept_name = 'Sales' OR department.dept_name = 'Development';

--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name) 
FROM employee 
Group By last_name 
ORDER BY COUNT(last_name) DESC;