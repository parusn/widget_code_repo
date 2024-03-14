/*			***********************Widget Ltd ********************************

Project Name : Widget Ltd
Developed by : Parvathy Nair
Date : 12/03/2024
Page 3/7
* *********************************************************************************/

/*-----------------------------------------------------------------------------------------------------------------
**********************************************************************************************************************
--4. Create an appropriate executable database object to allow the Salary for an Employee to be increased or decreased by a percentage
**********************************************************************************************************************

******************************************* SOLUTION******************************************
/*-----------------------------------------------------------------------------------------------------------------
--Package Name:get_salary
--Procedure inc_emp_salary to get increment percentage Salary
--Procedure dec_emp_salary to get decrement percentage Salary
**********************************************************************************************************************
-- Step 1 
-- Package Spec
**********************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------*/

 SET SERVEROUTPUT ON
CREATE OR REPLACE PACKAGE get_salary IS 
   PROCEDURE inc_emp_salary(in_empid employee.emp_id%type,inc_percentage IN NUMBER); -- To get the Salary Increment 
   PROCEDURE dec_emp_salary(in_empid employee.emp_id%type,dec_percentage IN NUMBER); -- To get the Salary Decrement
END get_salary;
/


/***********************************************************************************************************************
-- Step 2 
-- -- Package Body
**********************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------*/


CREATE OR REPLACE PACKAGE Body get_salary IS
PROCEDURE inc_emp_salary(in_empid employee.emp_id%type,inc_percentage IN NUMBER ) IS
   old_salary Employee.Salary%type;
   new_inc_salary Employee.Salary%type;
   n_name Employee.emp_name%type;
   
  BEGIN
  SELECT salary,emp_name INTO old_salary,n_name --current salary of employee
  FROM employee
  WHERE emp_id = in_empid;
  
  new_inc_salary:= old_salary * (1 + inc_percentage / 100); -- Calculation 
  
  IF SQL%FOUND THEN
  
   UPDATE Employee SET SALARY = new_inc_salary
   WHERE emp_id=in_empid;
   COMMIT;										-- Can be used to update the new salary for the employee in the table
   
   DBMS_OUTPUT.PUT_LINE('Employee ' || n_name ||' got ' || inc_percentage||'% increment in salary 
   and the new incremented salary  is ' || new_inc_salary || ' Congraluation! ');
   
  ELSE
    RAISE NO_DATA_FOUND; 
  END IF;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee  ' || n_name || ' not found. Please provide valid Employee ID');
END inc_emp_salary;
  
PROCEDURE dec_emp_salary(in_empid employee.emp_id%type,dec_percentage IN NUMBER) IS
   old_salary Employee.Salary%type;
   new_dec_salary Employee.Salary%type;
   n_name Employee.emp_name%type;
   
  BEGIN
  SELECT salary,emp_name INTO old_salary,n_name  --current salary of employee
  FROM employee
  WHERE emp_id = in_empid;
  
  new_dec_salary:= old_salary * (1 - dec_percentage / 100); -- Calculation
  
  IF SQL%FOUND THEN
   UPDATE Employee SET SALARY = new_dec_salary
   WHERE emp_id=in_empid;
   COMMIT;										-- Can be used to update the new salary for the employee in the table
   
   DBMS_OUTPUT.PUT_LINE('Employee ' ||  n_name ||' got ' || dec_percentage||'% decreased in salary 
   and the new decreased salary  is ' || new_dec_salary || ' Better luck next time! ');
  ELSE
    RAISE NO_DATA_FOUND; 
  END IF;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee ID ' || n_name || ' not found. Please provide valid Employee ID');

END dec_emp_salary;

END get_salary;
/


/********************************END*************************************/