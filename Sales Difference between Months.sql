CREATE TABLE sales (
         sale_id INT, 
         product_id INT, 
         sale_date DATE, 
         sales_amount DECIMAL(10, 2)
     );
     INSERT INTO sales VALUES 
         (1, 1, '2024-01-10', 50000.00), 
         (2, 1, '2024-02-20', 70000.00), 
         (3, 2, '2024-01-15', 30000.00), 
         (4, 1, '2024-03-10', 60000.00);


SELECT * FROM SALES


/*
Find the difference in sales between the current month and the previous month for each product.
*/

WITH previous_month AS (
    SELECT 
        product_id,
        SUM(sales_amount) AS previous_month_sales
    FROM 
        sales
    WHERE 
        EXTRACT(MONTH FROM sale_date) = EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '1 MONTH')
        AND EXTRACT(YEAR FROM sale_date) = EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '1 MONTH')
    GROUP BY 
        product_id
),
current_month AS (
    SELECT 
        product_id,
        SUM(sales_amount) AS current_month_sales
    FROM 
        sales
    WHERE 
        EXTRACT(MONTH FROM sale_date) = EXTRACT(MONTH FROM CURRENT_DATE)
        AND EXTRACT(YEAR FROM sale_date) = EXTRACT(YEAR FROM CURRENT_DATE)
    GROUP BY 
        product_id
)
SELECT 
    cm.product_id,
    cm.current_month_sales,
    COALESCE(pm.previous_month_sales, 0) AS previous_month_sales,
    (cm.current_month_sales - COALESCE(pm.previous_month_sales, 0)) AS difference_in_sales
FROM 
    current_month cm
LEFT JOIN 
    previous_month pm ON cm.product_id = pm.product_id;
