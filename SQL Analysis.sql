-- SQL Exploration


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

