CREATE TABLE transactions (
         transaction_id INT PRIMARY KEY, 
         customer_id INT, 
         amount DECIMAL(10, 2), 
         transaction_date DATE
     );
     INSERT INTO transactions VALUES 
         (1, 1, 1000.00, '2023-11-10'), 
         (2, 2, 1500.00, '2023-05-12'), 
         (3, 1, 2000.00, '2023-06-15'), 
         (4, 3, 500.00, '2024-01-20');


SELECT * FROM TRANSACTIONS

/*
Retrieve the top 5 customers who spent the most money in the last year.
*/

SELECT CUSTOMER_ID,
	   SUM(AMOUNT) AS MOST_MONEY
FROM TRANSACTIONS
WHERE TRANSACTION_DATE >=  CURRENT_DATE - INTERVAL '1 Year'
GROUP BY 1
LIMIT 5