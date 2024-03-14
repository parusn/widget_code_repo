/***********************************************************************************************************************
-- Step 2
-- Calling Block to change the department of the employee
-- Calling Procedure Name : change_employee_department
**********************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------*/
set head off
select 'Enter the following details to change the department of an employee' from dual;

DECLARE
n_empid Employee.Emp_Id%TYPE :='&Employee_id';
n_DeptId Department.Dept_id%type :='&New_Department_id';
n_employeename Employee.Emp_name%type;
old_deptid Employee.Dept_Id%type;

BEGIN
SELECT Emp_name,Dept_Id INTO n_employeename,old_deptid
  FROM Employee
  WHERE Emp_id=n_empid;
  IF SQL%FOUND THEN
change_employee_department(n_empid,n_employeename,old_deptid,n_DeptId);
END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('Employee ID ' || n_empid || ' not found. Please provide valid Employee ID');
END;
/
