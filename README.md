# IT Project & Employee Performance Dashboard

## 📌 Project Overview
This project focuses on analyzing IT project performance and employee workload using **SQL and Power BI**.  
The goal is to identify delayed projects, understand how work is distributed among employees, and present insights through an interactive dashboard to support better decision-making in an IT company.

---

## 🧠 Business Problem
In IT companies, project and employee data is often stored in spreadsheets, making it difficult for managers to:
- Track project completion status
- Identify delayed projects
- Monitor employee workload

This lack of visibility can lead to project delays and inefficient resource utilization.

---

## 🎯 Project Objectives
- Track the total number of IT projects  
- Identify completed and delayed projects  
- Compare planned vs actual project timelines  
- Analyze employee workload based on hours worked  
- Visualize insights using a Power BI dashboard  

---

## 🛠 Tools & Technologies Used
- **MySQL** – Data storage and querying  
- **SQL** – Data analysis and transformation  
- **Power BI** – Data visualization and dashboard creation  
- **Excel / CSV** – Data preparation  

---

## 📂 Dataset Description

### Projects Dataset
| Column Name | Description |
|------------|-------------|
| project_id | Unique project identifier |
| project_name | Name of the project |
| planned_end | Planned project end date |
| actual_end | Actual project end date |
| status | Completed / Delayed |

### Employees Dataset
| Column Name | Description |
|------------|-------------|
| emp_id | Employee ID |
| emp_name | Employee name |
| project_id | Project assigned |
| hours_worked | Total hours worked |
| role | Employee role |

---

## 🧮 SQL Analysis
The data was imported into MySQL tables. SQL queries were used to:
- Identify delayed projects using date comparison
- Count projects by status
- Calculate employee workload using total hours worked
- Combine project and employee data using JOIN

### Example Query – Delayed Projects
```sql
SELECT project_name,
DATEDIFF(actual_end, planned_end) AS delay_days
FROM projects
WHERE actual_end > planned_end;
