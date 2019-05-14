--Homework 7-SQL 
--Mark Ludwick

/**********************************************************
1. List the following details of each department employee: 
    employee number, last name, first name, gender, and salary
***********************************************************/
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.gender, Salaries.salary
FROM Salaries
  INNER JOIN Employees ON
  Employees.emp_no = Salaries.emp_no;
  
/**********************************************************
2. List employees who were hired in 1986.
***********************************************************/
SELECT *
FROM  Employees
WHERE  hire_date >= '1986-01-01' AND hire_date < '1987-01-01' ;

/**********************************************************
3. List the manager of each department with the following 
information: department number, department name, the 
manager's employee number, last name, first name, and 
start and end employment dates.
***********************************************************/
SELECT DeptMgr.dept_no, Departments.dept_name, DeptMgr.emp_no,  Employees.last_name, Employees.first_name, DeptEmp.from_date, DeptEmp.to_date
FROM  DeptMgr, Departments, Employees, DeptEmp
WHERE DeptMgr.dept_no = Departments.dept_no
AND   DeptMgr.emp_no = Employees.emp_no
AND   DeptMgr.emp_no = DeptEmp.emp_no;

/**********************************************************
4. List the department of each employee with the following 
information: employee number, last name, first name, and 
department name.
***********************************************************/
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM  Employees, DeptEmp, Departments
WHERE Employees.emp_no = DeptEmp.emp_no
AND   DeptEmp.dept_no = Departments.dept_no ;

/**********************************************************
5. List all employees whose first name is "Hercules" and 
last names begin with "B."
***********************************************************/
SELECT  * 
FROM Employees
WHERE  first_name = 'Hercules' AND last_name LIKE 'B%';

/**********************************************************
6. List all employees in the Sales department, including 
their employee number, last name, first name, and 
department name.
***********************************************************/
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM  Employees, DeptEmp, Departments
WHERE Employees.emp_no = DeptEmp.emp_no
AND   DeptEmp.dept_no = Departments.dept_no
AND   Departments.dept_name = 'Sales';

/**********************************************************
7. List all employees in the Sales and Development 
departments, including their employee number, last name, 
first name, and department name.
***********************************************************/
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM  Employees, DeptEmp, Departments
WHERE Employees.emp_no = DeptEmp.emp_no
AND   DeptEmp.dept_no = Departments.dept_no
AND   Departments.dept_name = 'Sales' 
UNION
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM  Employees, DeptEmp, Departments
WHERE Employees.emp_no = DeptEmp.emp_no
AND   DeptEmp.dept_no = Departments.dept_no
AND Departments.dept_name = 'Development' ;

/**********************************************************
8. In descending order, list the frequency count of 
employee last names, i.e., how many employees share each 
last name.
***********************************************************/

SELECT last_name, COUNT(*) FROM Employees GROUP BY last_name
ORDER BY count


