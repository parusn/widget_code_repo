/*-----------------------------------------------------------------------------------------------------------------
**********************************************************************************************************************                     
2.  Populate the Departments and Employees data structures using the data specified in the Appendix
**********************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------*/

 -- Insert value in Department table
 BEGIN
INSERT INTO Department(Dept_Id,Dept_Name,Location) values (1,'Management','London');
INSERT INTO Department(Dept_Id,Dept_Name,Location) values (2,'Engineering','Cardiff');
INSERT INTO Department(Dept_Id,Dept_Name,Location) values (3,'Research and Development','Edinburgh');
INSERT INTO Department(Dept_Id,Dept_Name,Location) values (4,'Sales','Belfast');
COMMIT;
DBMS_OUTPUT.PUT_LINE ('Successfully loaded data into Department Table');
END;
/
-- Insert value in Employee table

BEGIN

INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Hired_Date,Salary,Dept_Id) 
values (90001 ,'John Smith','CEO',to_date('01/01/95','DD/MM/RR'),100000,1);

INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id) 
values (90002,'Jimmy Willis','Manager',90001,to_date('23/09/03','DD/MM/RR'),52500,4);

INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id) 
values (90003,'Roxy Jones','Salesperson',90002,to_date('11/02/17','DD/MM/RR'),35000,4);

INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id) 
values (90004,'Selwyn Field','Salesperson',90003,to_date('20/05/15','DD/MM/RR'),32000,4);

INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id) 
values (90005,'David Hallett','Engineer',90006,to_date('17/04/18','DD/MM/RR'),40000,2);

INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id) 
values (90006,'Sarah Phelps','Manager',90001,to_date('21/03/15','DD/MM/RR'),45000,2);

INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id) 
values (90007,'Louise Harper','Engineer',90006,to_date('01/01/13','DD/MM/RR'),47000,2);

INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id) 
values (90008,'Tina Hart','Engineer',90009,to_date('28/07/14','DD/MM/RR'),45000,3);

INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id) 
values (90009,'Gus Jones','Manager',90001,to_date('15/05/18','DD/MM/RR'),50000,3);

INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id) 
values (90010,'Mildred Hall','Secretary',90001,to_date('12/10/96','DD/MM/RR'),35000,1);
COMMIT;
DBMS_OUTPUT.PUT_LINE ('Successfully loaded data into Employee Table');
END;
/

-- Values in Department and Employee Table
set lines 160
set linesize 1000
select * from Department;
select * from Employee;

/*********************************************************
--Other method
-- Insert value in Department table user input
INSERT INTO Department(Dept_Id,Dept_Name,Location) values (&Dept_Id,'&Dept_Name','&Dept_Name');

-- Insert value in Employee table user input
INSERT INTO Employee(Emp_id,Emp_name,Job_Title,Manager_id,Hired_Date,Salary,Dept_Id) 
values (&Emp_id ,'&Emp_name','&Job_Title',&Manager_id,to_date('&Hired_Date','DD/MM/RR'),&Salary,&Dept_Id);

/********************************END*************************************/
