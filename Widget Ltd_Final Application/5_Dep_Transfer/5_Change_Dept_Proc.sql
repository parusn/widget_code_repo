/*			***********************Widget Ltd ********************************

Project Name : Widget Ltd
Developed by : Parvathy Nair
Date : 12/03/2024
Page 4/7
* ********************************************************************************
--5. Create an appropriate executable database object to allow the transfer of an Employee to a different Department

/******************************************* SOLUTION******************************************

-- Step 1 
-- Procedure to change the department of the Given employee
-- Procedure Name:change_employee_department
**********************************************************************************************************************/
 SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE change_employee_department (n_empid IN NUMBER,n_employeename IN Varchar,old_deptid IN NUMBER,new_DeptId IN NUMBER) 
IS
  new_Deptname Department.Dept_Name%type ;
  BEGIN
  
  SELECT Dept_Name INTO new_Deptname
  FROM Department
  WHERE Dept_Id= new_DeptId;
  
  DBMS_OUTPUT.PUT_LINE('Department name ' || new_Deptname );
  
  IF SQL%FOUND THEN
   UPDATE Employee
   SET Dept_Id=new_DeptId
   WHERE Emp_id=n_empid;
   COMMIT;
   DBMS_OUTPUT.PUT_LINE('Employee ' || n_employeename ||' Department is updated from  old department ' || old_deptid || ' to new department ' || new_DeptId  || ' successfully !');
   
   END IF;
   
   EXCEPTION
   WHEN NO_DATA_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('Department name ' || new_Deptname || ' not found. Please provide valid Department ID');
   WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error in change_employee_department');
   
   END change_employee_department;
   /

/********************************END*************************************/