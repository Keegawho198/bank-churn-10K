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
