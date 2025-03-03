# Bank Churn Analysis

-- Keegan Nair

## Understanding Customer Retention: Churn Prediction with MySQL & Tableau

![Main Dashboard](Resources/screenshots/Main%20Dashboard.png)

### Project Overview
This project aims to analyze customer churn using:
- **Python** for data cleaning and preprocessing
- **MySQL** for storing and querying data
- **Tableau** for data visualization and insights

Churn prevention is crucial as retaining existing customers is more cost-effective than acquiring new ones. By analyzing the factors influencing churn, banks can create retention strategies to improve customer loyalty.

### Dataset Information
- **Source:** Kaggle
- **Dataset Link:** [Bank Customer Churn](https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn/data)
- **Description:** This dataset contains information about 10,000 bank customers, including demographics, account details, and whether they have churned.

## Column Descriptions

### Features in the Dataset:

RowNumber — Row index (not relevant to analysis)

CustomerId — Unique identifier for each customer

Surname — Customer's last name (not a determining factor in churn)

CreditScore — Higher scores indicate financial reliability, potentially lowering churn risk

Geography — The customer's country, which may influence churn trends

Gender — Helps analyze if gender affects churn rates

Age — Older customers are generally more loyal than younger ones

Tenure — Number of years the customer has been with the bank

Balance — Customers with higher balances are less likely to churn

NumOfProducts — The number of products the customer has with the bank

HasCrCard — Whether the customer has a credit card ('Yes'/'No')

IsActiveMember — Whether the customer is actively engaged ('Yes'/'No')

EstimatedSalary — Income level, which can correlate with churn probability

Exited — Indicates whether the customer has churned ('Yes'/'No')

Complain — Whether the customer has filed a complaint ('Yes'/'No')

SatisfactionScore — Customer's rating of their satisfaction

CardType — The type of card the customer holds

PointsEarned — Rewards points accumulated through credit card usage



## Data Cleaning & Preprocessing
### Binary Value Conversion
The dataset does not explicitly state the meaning of `0` and `1` values. Through analysis, the following assumptions were made:
- `1` → Yes/True/Positive
- `0` → No/False/Negative

#### Column Interpretation:
- **HasCrCard**: 1 = Has a credit card, 0 = Does not have a credit card
- **IsActiveMember**: 1 = Active customer, 0 = Inactive customer
- **Exited**: 1 = Customer churned, 0 = Customer stayed
- **Complain**: 1 = Customer filed a complaint, 0 = No complaint

### Steps Taken:
1. Checked for missing values (none found)
2. Checked for duplicate rows (none found)
3. Converted binary values to `Yes/No`
4. Dropped the `RowNumber` column as it has no analytical value
5. Saved the cleaned dataset as `cleaned_customer_churn.csv`

## Database Setup & SQL Queries
### MySQL Integration
1. **Created a MySQL Database:**
   ```sql
   CREATE DATABASE CustomerChurn;
   ```
2. **Created a Table:**
   ```sql
   CREATE TABLE Customers (
       CustomerId INT PRIMARY KEY,
       Surname VARCHAR(50),
       CreditScore INT,
       Geography VARCHAR(50),
       Gender VARCHAR(10),
       Age INT,
       Tenure INT,
       Balance FLOAT,
       NumOfProducts INT,
       HasCrCard VARCHAR(3),
       IsActiveMember VARCHAR(3),
       EstimatedSalary FLOAT,
       Exited VARCHAR(3),
       Complain VARCHAR(3),
       SatisfactionScore INT,
       CardType VARCHAR(50),
       PointEarned INT
   );
   ```
3. **Loaded Data into MySQL** using Python (`pymysql`)
4. **Executed Exploratory SQL Queries** to analyze trends

## Tableau Dashboard & Insights
### Key Findings:
1. **Overall Churn Rate**
   - 2,038 customers exited (around 20% churn rate)
   - Majority churn occurred in the **40-50 age group**
   
2. **Gender-Based Analysis**
   - Slightly more female customers churned than males
   
3. **Geographic Influence**
   - France & Germany had a churn rate **double that of Spain**

4. **Product Holding & Churn**
   - Customers with **only one product** had the highest churn rate
   
5. **Customer Complaints**
   - **90% of customers who filed complaints churned**
   
6. **Credit Score Impact**
   - **600-700 credit score range** had the highest churn

## Recommendations & Next Steps
- **Retention Strategy**: Focus on **40-50 age group** and customers with **one product**
- **Customer Engagement**: Address complaints promptly to reduce churn
- **Geographic Targeting**: Special campaigns for France & Germany
- **Credit Score Consideration**: Identify at-risk customers with moderate credit scores

## Learning Resources
- **Handling Duplicates in Pandas:** [Saturn Cloud](https://saturncloud.io/blog/how-to-find-all-duplicate-rows-in-a-pandas-dataframe/)
- **Using `.env` Files in Python:** [GeeksforGeeks](https://www.geeksforgeeks.org/how-to-create-and-use-env-files-in-python/), [Dev.to](https://dev.to/jakewitcher/using-env-files-for-environment-variables-in-python-applications-55a1)

## Environment Variables (`.env`)
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=   # Replace with your actual password
DB_NAME=CustomerChurn
```


