/*			***********************Widget Ltd ********************************

Project Name : Widget Ltd
Developed by : Parvathy Nair
Date : 12/03/2024
Page 2/7
* *********************************************************************************/


/*-----------------------------------------------------------------------------------------------------------------
**********************************************************************************************************************
-- 3. Create an appropriate executable database object to allow an Employee to be created
**********************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
**********************************************************************************************************************
-- Step 1 
-- Package to insert new Employee details
-- Package Name : p_create_employee
**********************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------*/
SET SERVEROUTPUT ON


CREATE OR REPLACE PROCEDURE p_create_employee(v_Emp_Id IN NUMBER,v_Emp_name IN VARCHAR2,v_Job_Title IN VARCHAR2,
v_Manager_id IN NUMBER,v_Hired_Date IN VARCHAR2,v_Salary IN NUMBER,v_Dept_Id IN NUMBER)
AS
        eid NUMBER; -- emp_id type
        did NUMBER;   -- dept_id type 
     BEGIN
-- Employee id check    
      SELECT count(*) INTO eid
        FROM employee
        WHERE Emp_Id = v_Emp_Id;

		
       IF (eid>0) THEN
        DBMS_OUTPUT.PUT_LINE('Employee ID already exists.');
		-- Department id check Contraints
        ELSE
		SELECT count(*) into did
        FROM Department
        WHERE Dept_Id = v_Dept_Id;
		    IF did=0 THEN
		 DBMS_OUTPUT.PUT_LINE('Department ID  '|| v_Dept_Id ||'  not exist');
		 ELSE
		 -- Insert value in Employee table 
		 INSERT INTO Employee(Emp_Id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id)
         Values(v_Emp_Id,v_Emp_name,v_Job_Title,v_Manager_id,v_Hired_Date,v_Salary,v_Dept_Id);
		 
		 COMMIT;
		 DBMS_OUTPUT.PUT_LINE('Employee created successfully!');
		END IF;
		END IF;
	EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error creating employee: ' || SQLCODE || ' - ' || SQLERRM);
END p_create_employee;	 
 /
 
