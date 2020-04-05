############################
############################

-- Question 1: List the following details of each employee: employee number,
-- last name, first name, gender, and salary.


SELECT E.emp_no, E.last_name, E.first_name, E.gender, S.salary
FROM "Employees" E
LEFT JOIN "Salaries" S
ON S.emp_no = E.emp_no;


-- Question 2: List employees who were hired in 1986.

SELECT "emp_no", "hire_date" FROM "Employees"
WHERE "hire_date" >= '1986-01-01'::date
AND "hire_date" <= '1986-12-31'::date;


-- Question 3: List the manager of each department with the following information: department number,
--department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT E.emp_no, E.last_name, E.first_name, DM.from_date,
	DM.to_date, DM.dept_no, D.dept_name
FROM "Employees" E
INNER JOIN "Dept_Managers" DM
	ON DM.emp_no = E.emp_no
INNER JOIN "Departments" D
	ON D.dept_no = DM.dept_no;
	
	
	
-- Question 4: List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM "Employees" E
INNER JOIN "Dept_Employees" DE
	ON E.emp_no = DE.emp_no
INNER JOIN "Departments" D
	ON D.dept_no = DE.dept_no

UNION

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM "Employees" E
INNER JOIN "Dept_Managers" DM
	ON E.emp_no = DM.emp_no
INNER JOIN "Departments" D
	ON D.dept_no = DM.dept_no;
	

-- Question 5: List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM "Employees"
WHERE first_name = 'Hercules' AND last_name like 'B%';


-- Question 6: List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT E.emp_no, E.first_name, E.last_name, 'Sales' AS Department_Name
FROM "Employees" E
WHERE E.emp_no IN (
	SELECT DE.emp_no
	FROM "Dept_Employees" DE
	WHERE DE.dept_no IN (
		SELECT D.dept_no
		FROM "Departments" D
		WHERE dept_name = 'Sales'));


-- Question 7: List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.


SELECT E.emp_no, E.first_name, E.last_name, D.dept_name
FROM "Employees" E
INNER JOIN "Dept_Employees" DE
	ON DE.emp_no = E.emp_no
INNER JOIN "Departments" D
	ON D.dept_no = DE.dept_no
WHERE D.dept_name = 'Sales' OR D.dept_name = 'Development'

UNION

SELECT E.emp_no, E.first_name, E.last_name, D.dept_name
FROM "Employees" E
INNER JOIN "Dept_Managers" DM
	ON DM.emp_no = E.emp_no
INNER JOIN "Departments" D
	ON D.dept_no = DM.dept_no
WHERE D.dept_name = 'Sales' OR D.dept_name = 'Development';


-- Question 8: In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.


SELECT E.last_name, count (last_name) as name_cnt
FROM "Employees" E
GROUP BY last_name
ORDER BY name_cnt desc;










