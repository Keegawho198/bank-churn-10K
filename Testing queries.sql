-- Testing queries 
USE customerchurn;


SELECT *
FROM customers;

SELECT tenure
FROM customers
ORDER BY tenure DESC
limit 5;

SELECT Exited, Complain
FROM customers
WHERE Complain = "YES" AND Exited = "Yes";


SELECT COUNT(Exited), Exited, NumOfProducts
FROM customers
WHERE Exited = 'Yes'
GROUP BY Exited, NumOfProducts;

SELECT *
FROM customers
WHERE balance = 0 AND Exited = 'YES'
ORDER BY balance DESC;


-- test CTE

WITH CustomerGroups AS (
    SELECT Geography,
           CASE 
               WHEN Age BETWEEN 0 AND 21 THEN 'Young Adult'
               WHEN Age BETWEEN 22 AND 39 THEN 'Adult'
               WHEN Age BETWEEN 40 AND 59 THEN 'Middle Aged Adult'
               ELSE 'Senior'
           END AS AgeCategory,
           CASE 
               WHEN Balance = 0 THEN 'No Balance'
               WHEN Balance BETWEEN 1 AND 20000 THEN 'Low Balance'
               WHEN Balance BETWEEN 20001 AND 60000 THEN 'Medium Balance'
               WHEN Balance BETWEEN 60001 AND 120000 THEN 'High Balance'
               ELSE 'Very High Balance'
           END AS BalanceCategory,
           Exited
    FROM Customers
)
SELECT Geography, AgeCategory, BalanceCategory, 
       ROUND(AVG(CASE WHEN Exited = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS ChurnRate
FROM CustomerGroups
GROUP BY Geography, AgeCategory, BalanceCategory;
