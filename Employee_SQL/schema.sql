DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department_manager;
DROP TABLE IF EXISTS department_employee;
DROP TABLE IF EXISTS salary;

CREATE TABLE department (
  dept_no varchar(20) NOT NULL PRIMARY KEY,
  dept_name varchar(260) NOT NULL
);

CREATE TABLE title (
  title_id varchar(20) NOT NULL PRIMARY KEY,
  title varchar(260) NOT NULL
);

CREATE TABLE employee (
  emp_no varchar(20) NOT NULL PRIMARY KEY,
  emp_title_id varchar(20),
  birth_date DATE NOT NULL,
  first_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  sex varchar(20) NOT NULL,
  hire_date DATE NOT NULL,
  FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);

CREATE TABLE department_manager (
  emp_no varchar(20),
  dept_no varchar(20),
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
  FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

CREATE TABLE department_employee (
  emp_no varchar(20),
  dept_no varchar(20),
  FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
  FOREIGN KEY (dept_no) REFERENCES department(dept_no),
  PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salary (
  emp_no varchar(20) PRIMARY KEY,
  salary int NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);