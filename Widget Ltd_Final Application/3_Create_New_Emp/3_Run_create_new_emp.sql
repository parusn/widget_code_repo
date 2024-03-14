
set head off
select 'Enter the following details for new employee' from dual;
 
 /***********************************************************************************************************************
-- Step 2
-- Calling Procedure Name:  p_create_employee
**********************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------*/

BEGIN	
--DBMS_OUTPUT.PUT_LINE ('Enter the following details for new employee');
p_create_employee(&New_Emp_Id,'&New_Emp_name','&New_Emp_Job_Title',&New_Emp_Manager_id,'&New_Emp_Hired_Date',&New_Emp_Salary,&New_Emp_Dept_Id);
END;
/
  
/********************************END*************************************/  