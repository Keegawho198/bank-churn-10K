DROP DATABASE CustomerChurn;

CREATE DATABASE CustomerChurn;
USE CustomerChurn;

CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    Surname VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    NumOfProducts INT,
    Geography VARCHAR(100),
    CreditScore INT,
    Tenure INT,
    Balance FLOAT,
    HasCrCard VARCHAR(3),
    CardType VARCHAR(55),
    IsActiveMember VARCHAR(3),
    EstimatedSalary FLOAT,
    PointEarned INT,
    SatisfactionScore INT,
    Exited VARCHAR(3),
    Complain VARCHAR(3)
);




SELECT *
FROM customers;