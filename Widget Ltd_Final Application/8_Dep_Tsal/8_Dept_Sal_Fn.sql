/*			***********************Widget Ltd ********************************

Project Name : Widget Ltd
Developed by : Parvathy Nair
Date : 12/03/2024
Page 7/7
*********************************************************************************
--8. Write a report to show the total of Employee Salary for a Department

 /******************************************* SOLUTION******************************************
-----------------------------------------------------------------------------------------------------------------
-- Step 1 
- Function to display total of Employee Salary for a Department
--Function Name : get_department_Salary
**********************************************************************************************************************/
 SET SERVEROUTPUT ON
CREATE OR REPLACE Function get_department_Salary (in_deptname IN VARCHAR2)
RETURN Number IS
  total_salary Employee.Salary%type;
BEGIN
  SELECT SUM(e.Salary) INTO total_salary
from Employee e INNER JOIN Department d 
ON e.Dept_id=d.Dept_id
Where d.dept_name=in_deptname
group by(d.dept_name);
  
  IF total_salary IS NULL THEN
    RAISE NO_DATA_FOUND; 
  END IF;
  
  RETURN total_salary;
END get_department_Salary;
/

/********************************END*************************************/