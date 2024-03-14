/*			***********************Widget Ltd ********************************

Project Name : Widget Ltd
Developed by : Parvathy Nair
Date : 12/03/2024
Page 6/7
*********************************************************************************
--7. Write a report to show all Employees for a Department

 /******************************************* SOLUTION******************************************
-----------------------------------------------------------------------------------------------------------------
-- Step 1 
- Procedure to display all employee details for a given department
--Procedure Name : p_report_Employee_details
**********************************************************************************************************************/
 SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p_report_Employee_details(n_deptname IN VARCHAR2)
IS

CURSOR emp_cur IS
SELECT e.EMP_ID,e.Emp_name,e.Job_Title,e.Salary,d.dept_name
from Employee e INNER JOIN Department d 
ON e.Dept_id=d.Dept_id
Where d.dept_name=n_deptname;

emp_rec emp_cur%ROWTYPE;
  
BEGIN
OPEN emp_cur;
DBMS_OUTPUT.PUT_LINE('REPORT OF Employees in Department ' ||n_deptname);
LOOP
FETCH emp_cur INTO emp_rec;
EXIT WHEN emp_cur%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID : '||emp_rec.EMP_ID||' EMPLOYEE NAME : '||emp_rec.Emp_name||'  EMPLOYEE Job_Title : '||emp_rec.Job_Title||'  EMPLOYEE Salary : '||emp_rec.Salary);
END LOOP;
CLOSE emp_cur; 
END;
/


/********************************END*************************************/