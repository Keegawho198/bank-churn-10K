-- SQL Exploration
USE customerchurn;

SELECT *
FROM customers;

-- Customer Distribution
-- How many customers from each country
SELECT  Geography, COUNT(*) AS Total_customers
FROM customers
GROUP BY Geography;

-- What is the gender breakdown of customers?
SELECT  Gender, COUNT(*) AS Total_customers
FROM customers
GROUP BY Gender;

-- What is the average age of customers who have churned?
SELECT  Exited, ROUND(AVG(Age)) AS average_age
FROM customers
GROUP BY Exited;

-- Do older customers stay longer before churning?
SELECT Exited, ROUND(AVG(Age)) AS average_age, ROUND(AVG(Tenure)) AS average_tenure
FROM customers
GROUP BY Exited;



-- Is there a pattern between Credit Score and churn?
SELECT ROUND(AVG(CreditScore)) AS avg_creditScore, Exited
FROM customers
GROUP BY Exited;



-- Do customers with higher balances churn less?
-- 🔹 AVG(Balance) for Exited = 0 vs. Exited = 1.
SELECT ROUND(AVG(balance),2) AS avg_bal, Exited
FROM customers
GROUP BY Exited;


-- How many products do most customers use?
SELECT NumOfProducts, COUNT(numOfProducts) AS customer_count
FROM customers
GROUP BY NumOfProducts;

-- Are customers with multiple products more likely to stay?
SELECT NumOfProducts, Exited, COUNT(numOfProducts) AS customer_count
FROM customers
GROUP BY NumOfProducts, Exited
ORDER BY NumOfProducts;


-- Are active members less likely to churn?
-- 🔹 Compare IsActiveMember = 1 vs. IsActiveMember = 0 for Exited.
SELECT IsActiveMember, Exited, COUNT(*) AS total_Customer
FROM customers
GROUP BY IsActiveMember, Exited
ORDER BY IsActiveMember;

-- Do dissatisfied customers churn more?
-- 🔹 Find churn rate for different SatisfactionScore levels using GROUP BY.
SELECT COUNT(exited), SatisfactionScore, exited
FROM customers
GROUP BY SatisfactionScore, exited;



-- Do customers who file complaints churn more often?
-- 🔹 Compare Complain = 1 vs. Complain = 0 for Exited.

-- Which group of customers (age, geography, balance) is most likely to churn?
-- 🔹 Use GROUP BY with multiple columns (Geography, Age, Balance).

-- What is the churn rate per country?
-- 🔹 COUNT() of total customers vs. churned customers per country.


-- How much estimated salary is lost due to churn?
-- 🔹 SUM(EstimatedSalary) for Exited = 1.

-- What is the average salary of churned vs. retained customers?
-- 🔹 AVG(EstimatedSalary), grouping by Exited.


-- Find customers at highest risk of churning (multiple risk factors).
-- 🔹 Look for CreditScore < X, Balance = 0, SatisfactionScore < X, etc.

-- Which Card Type has the highest retention rate?
-- 🔹 GROUP BY CardType, then compare Exited percentages.