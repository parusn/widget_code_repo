 /*			***********************Widget Ltd ********************************

Project Name : Widget Ltd
Developed by : Parvathy Nair
Date : 12/03/2024
Page 5/7
*********************************************************************************
 
 --6. Create an appropriate executable database object to return the Salary for an Employee
 
 /******************************************* SOLUTION******************************************
-----------------------------------------------------------------------------------------------------------------*/
/***********************************************************************************************************************
-- Step 1 
- Function to get the salary  of the Given employee
-- Function Name: get_employee_salary
**********************************************************************************************************************/
  SET SERVEROUTPUT ON
CREATE OR REPLACE Function get_employee_salary (in_empid IN NUMBER)
RETURN Number IS
  n_salary Employee.Salary%type;
BEGIN
  SELECT salary INTO n_salary
  FROM employee
  WHERE emp_id = in_empid;
  
  IF n_salary IS NULL THEN
    RAISE NO_DATA_FOUND; 
  END IF;
  
  RETURN n_salary;
END get_employee_salary;
/

/********************************END*************************************/
