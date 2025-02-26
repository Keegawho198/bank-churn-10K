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
SELECT IsActiveMember, Exited, COUNT(*) AS total_Customer
FROM customers
GROUP BY IsActiveMember, Exited
ORDER BY IsActiveMember;

-- Do dissatisfied customers churn more?
SELECT COUNT(exited) AS customers, SatisfactionScore, exited
FROM customers
GROUP BY SatisfactionScore, exited
ORDER BY SatisfactionScore;



-- Do customers who file complaints churn more often?
SELECT COUNT(exited) AS customers, Complain, exited
FROM customers
GROUP BY Complain, exited
ORDER BY Complain;

-- Which group of customers (age, geography, balance) is most likely to churn? (USE CASE FOR Balance and age)
-- USE CTE

WITH CustomerGroups AS (
SELECT geography,
		CASE 
			WHEN age BETWEEN 0 AND 21 THEN 'Young adult'
            WHEN age BETWEEN 22 AND 39 THEN 'Adult'
            WHEN age BETWEEN 40 AND 59 THEN 'Middle Aged Adult'
            ELSE 'Senior'
		END AS AgeCategory,
		CASE 
			WHEN balance = 0 THEN 'No Balance'
            WHEN balance BETWEEN 1 AND 20000 THEN 'Low Balance'
            WHEN balance BETWEEN  20001 AND 60000 THEN 'Medium Balance'
            WHEN balance BETWEEN 60001 and 120000 THEN 'High Balance'
            ELSE 'Very High Balance'
		END AS BalanceCategory,
            exited
FROM customers
)

SELECT Geography, AgeCategory, BalanceCategory, 
       ROUND(AVG(CASE WHEN Exited = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS ChurnRate
FROM CustomerGroups
GROUP BY Geography, AgeCategory, BalanceCategory;

-- can also use COUNT(CASE WHEN Exited = 'Yes' THEN 1 END) / COUNT(*) * 100


-- What is the churn rate per country?
SELECT Geography, COUNT(*) AS CustomerCount,
       ROUND(AVG(CASE WHEN Exited = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS ChurnRate
FROM customers
GROUP BY Geography;


-- How much estimated salary is lost due to churn?
SELECT ROUND(SUM(EstimatedSalary),2) AS Total_Lost
FROM customers
WHERE Exited = 'yes';

-- What is the average salary of churned vs. retained customers?
SELECT ROUND(AVG(EstimatedSalary),2) AS AVG_Estimated_Sal, exited
FROM customers
GROUP BY exited;

-- Find customers at highest risk of churning (multiple risk factors).
SELECT *
FROM Customers
WHERE CreditScore < 700
  AND Balance = 0
  AND SatisfactionScore < 3
  AND Exited = 'no';  

-- Which Card Type has the highest retention rate?
SELECT CardType, ROUND(COUNT(CASE WHEN Exited = 'No' THEN 1 END) * 100/ COUNT(*),2) AS RetentionRate
FROM customers
GROUP BY CardType
ORDER BY RetentionRate;

