
/***********************************************************************************************************************
-- Step 4 
-- Calling Block to get the Decreased Salary for an Employee
--Calling Procedure Name :get_salary.dec_emp_salary
**********************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------*/
set head off
select 'Enter the following details to get the salary decrement for an employee' from dual;

execute get_salary.dec_emp_salary(&Employee_id,&Decrease_Percentage);