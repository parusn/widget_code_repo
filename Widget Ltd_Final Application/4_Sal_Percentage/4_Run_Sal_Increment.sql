
/***********************************************************************************************************************
- Step 3 
-- Calling Block to get the Increment Salary for an Employee
-- Calling Procedure Name :get_salary.inc_emp_salary
**********************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------*/
set head off
select 'Enter the following details to get the salary increment for an employee' from dual;

execute get_salary.inc_emp_salary(&Employee_id,&inc_percentage);