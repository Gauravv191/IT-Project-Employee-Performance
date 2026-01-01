
/* 
====================================================
IT Project & Employee Performance Analysis
SQL Questions and Answers
====================================================
Database: MySQL
Tables Used: projects, employees
====================================================
*/


/* -------------------------------------------------
Q1. Show all projects available in the company
Business Question:
What are the different IT projects handled by the company?
------------------------------------------------- */

SELECT * 
FROM projects;


/* -------------------------------------------------
Q2. Count total number of projects
Business Question:
How many IT projects are there in total?
------------------------------------------------- */

SELECT 
COUNT(project_id) AS total_projects
FROM projects;


/* -------------------------------------------------
Q3. Find projects by status (Completed vs Delayed)
Business Question:
How many projects are completed and how many are delayed?
------------------------------------------------- */

SELECT 
status,
COUNT(project_id) AS project_count
FROM projects
GROUP BY status;


/* -------------------------------------------------
Q4. Identify delayed projects
Business Question:
Which projects were delivered late?
------------------------------------------------- */

SELECT 
project_name,
planned_end,
actual_end,
DATEDIFF(actual_end, planned_end) AS delay_days
FROM projects
WHERE actual_end > planned_end;


/* -------------------------------------------------
Q5. Find employees and their roles
Business Question:
What roles do employees have in the IT projects?
------------------------------------------------- */

SELECT 
emp_name,
role
FROM employees;


/* -------------------------------------------------
Q6. Calculate total hours worked by each employee
Business Question:
How much workload does each employee have?
------------------------------------------------- */

SELECT 
emp_name,
SUM(hours_worked) AS total_hours_worked
FROM employees
GROUP BY emp_name
ORDER BY total_hours_worked DESC;


/* -------------------------------------------------
Q7. Count number of projects handled by each employee
Business Question:
How many projects is each employee working on?
------------------------------------------------- */

SELECT 
emp_name,
COUNT(DISTINCT project_id) AS projects_handled
FROM employees
GROUP BY emp_name;


/* -------------------------------------------------
Q8. Combine project and employee data
Business Question:
Which employee is working on which project?
------------------------------------------------- */

SELECT 
e.emp_name,
e.role,
p.project_name,
p.status
FROM employees e
JOIN projects p
ON e.project_id = p.project_id;


/* -------------------------------------------------
Q9. Show employee workload with project status
Business Question:
How is employee workload distributed across completed and delayed projects?
------------------------------------------------- */

SELECT 
e.emp_name,
p.status,
SUM(e.hours_worked) AS total_hours
FROM employees e
JOIN projects p
ON e.project_id = p.project_id
GROUP BY e.emp_name, p.status;


/* -------------------------------------------------
Q10. Identify employees working on delayed projects
Business Question:
Which employees are assigned to delayed projects?
------------------------------------------------- */

SELECT DISTINCT
e.emp_name,
p.project_name,
p.status
FROM employees e
JOIN projects p
ON e.project_id = p.project_id
WHERE p.status = 'Delayed';


/* -------------------------------------------------
END OF SQL ANALYSIS
------------------------------------------------- */
