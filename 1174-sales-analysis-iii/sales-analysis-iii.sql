-- Write your PostgreSQL query statement below
SELECT
  Product.product_id,
  Product.product_name
FROM Product
INNER JOIN Sales
  USING (product_id)
GROUP BY Product.product_id, Product.product_name
HAVING COUNT(*) > 0
   AND SUM(CASE
             WHEN sale_date < '2019-01-01' OR sale_date > '2019-03-31' THEN 1
             ELSE 0
           END) = 0;
