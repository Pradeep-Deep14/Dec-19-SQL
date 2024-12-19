CREATE TABLE employees (
         employee_id INT PRIMARY KEY, 
         employee_name VARCHAR(100), 
         join_date DATE
     );
     INSERT INTO employees VALUES 
         (1, 'Anita', '2022-05-10'), 
         (2, 'Rahul', '2023-02-15'), 
         (3, 'Vikram', '2023-03-20');


SELECT * FROM EMPLOYEES

/*
Get the details of employees who joined after January 1, 2023
*/

SELECT EMPLOYEE_NAME
FROM EMPLOYEES
WHERE JOIN_DATE > '2023-01-01';