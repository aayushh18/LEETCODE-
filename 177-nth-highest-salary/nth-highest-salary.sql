CREATE OR REPLACE FUNCTION NthHighestSalary(N INT)
RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY
    SELECT DISTINCT sub.salary
    FROM (
      SELECT e.salary,
             DENSE_RANK() OVER (ORDER BY e.salary DESC) AS rnk
      FROM Employee AS e
    ) AS sub
    WHERE sub.rnk = N;
END;
$$ LANGUAGE plpgsql;
