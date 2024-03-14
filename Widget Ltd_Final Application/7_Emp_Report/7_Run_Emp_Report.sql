
/***********************************************************************************************************************
-- Step 2 
-- Execute Report to display all employee details for a given department 
--Calling Procedure Name : p_report_Employee_details
*****************************************************************/
set head off
select 'Enter the Department Name to get the Employee report' from dual;

execute p_report_Employee_details('&Department_name'); 