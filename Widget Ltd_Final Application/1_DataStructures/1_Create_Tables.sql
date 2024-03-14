/*			***********************Widget Ltd ********************************

Project Name : Widget Ltd
Developed by : Parvathy Nair
Date : 12/03/2024
Page 1/7
* *********************************************************************************/


/*-----------------------------------------------------------------------------------------------------------------
**********************************************************************************************************************
1. Create the necessary data structures to contain the data specified in the Appendix ensuring that data integrity is enforced
 **********************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------*/
 --Create Department Table
 SET SERVEROUTPUT ON
Create TABLE Department(Dept_Id Number(5) NOT NULL PRIMARY KEY, Dept_Name Varchar2(50) NOT NULL,Location Varchar2(50) NOT NULL);


 --Create Department Table
Create TABLE Employee(Emp_id Number(10) NOT NULL PRIMARY KEY,Emp_name Varchar2(50) NOT NULL,Job_Title Varchar2(50) NOT NULL,
Manager_id Number(10),Hired_Date DATE NOT NULL,Salary Number(10) NOT NULL,Dept_Id Number(5)NOT NULL,
CONSTRAINT fk_Department FOREIGN KEY (Dept_Id) REFERENCES Department(Dept_Id));

/********************************END*************************************/

