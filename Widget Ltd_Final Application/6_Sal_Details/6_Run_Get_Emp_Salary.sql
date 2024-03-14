
/***********************************************************************************************************************
-- Step 2
- Calling block for the function to get salary of a given Employee
-- Calling Function Name: get_employee_salary
**********************************************************************************************************************/

set head off
select 'Enter the following details to get the salary of an employee' from dual;

DECLARE
n_empid Employee.Emp_Id%TYPE :='&Employee_id';
o_salary Employee.salary%TYPE;
n_name Employee.Emp_name%TYPE;
BEGIN
SELECT Emp_name INTO n_name 
from Employee
WHERE Emp_Id=n_empid;
o_salary := get_employee_salary(n_empid);
DBMS_OUTPUT.PUT_LINE('Salary of Employee  ' || n_name ||' is '|| o_salary);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee ID ' || n_empid || ' not found. Please provide valid Employee ID');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error in get_employee_salary');
END;
/