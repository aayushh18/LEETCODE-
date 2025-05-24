-- Write your PostgreSQL query statement below
DELETE FROM Person P2
USING Person P1
WHERE P1.email = P2.email
  AND P1.id < P2.id;
