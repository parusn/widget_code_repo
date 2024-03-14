
/***********************************************************************************************************************
-- Step 2 
-- Call function to get total salary for a Department
-- Calling Function Name : get_department_Salary
*****************************************************************/

set head off
select 'Enter the department details to get the total salary' from dual;

SELECT get_department_Salary(Dept_name) as Total_Salary 
FROM Department
WHERE Dept_name='&Department_name';