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


## **Dataset Information**
- **Source:** Kaggle
- **Dataset Link:** [Bank Customer Churn](https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn/data)
- **Description:** The dataset contains **10,000 bank customer records**, including demographics, account details, and whether they have churned.



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


## **Data Cleaning & Preprocessing**
### **Binary Value Conversion**
The dataset did not explicitly define 0/1 values. Through analysis, we determined:
- `1` → Yes/True/Positive
- `0` → No/False/Negative

#### **Column Interpretation:**
- **HasCrCard**: 1 = Has a credit card, 0 = Does not have a credit card.
- **IsActiveMember**: 1 = Active customer, 0 = Inactive customer.
- **Exited**: 1 = Customer churned, 0 = Customer stayed.
- **Complain**: 1 = Customer filed a complaint, 0 = No complaint.

### **Steps Taken:**
1. Checked for missing values (none found).
2. Checked for duplicate rows (none found).
3. Converted binary values to `Yes/No`.
4. Dropped the `RowNumber` column as it had no analytical value.
5. Saved the cleaned dataset as `cleaned_customer_churn.csv`.

---

## **Database Setup & SQL Analysis**
### **MySQL Integration**
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
3. **Loaded Data into MySQL** using Python (`pymysql`).
4. **Executed SQL Queries** to analyze trends.

---

## **Key Findings from SQL & Tableau Analysis**

### **A. Overall Churn Rate**
 **Finding:**
- **20.38% of customers (2,038) left the bank.**

### **B. Churn by Geography**
 **Finding:**
- Germany has the **highest churn rate** at **32.4%**.
- France, despite a lower churn rate, had a similar number of churned customers due to a larger customer base.

 **Recommendation:**
- Investigate customer complaints and retention strategies in Germany.
- Address churn factors beyond just regional differences.

### **C. Impact of Age on Churn**
 **Finding:**
- **Customers aged 35-45 churn the most.**
- Older customers (50+) show **higher loyalty**.

 **Recommendation:**
- Develop **loyalty programs** for middle-aged customers.

### **D. Customer Activity & Churn**
 **Finding:**
- **Inactive members churn at 27%,** compared to **14% churn among active members.**

 **Recommendation:**
- Implement **engagement strategies** like rewards for activity.

### **E. Churn by Credit Score**
 **Finding:**
- Customers with **credit scores below 500** have a churn rate of **23.73%**.

 **Recommendation:**
- Provide **financial advisory services** to lower-credit-score customers.

### **F. Churn by Balance & Products Held**
 **Finding:**
- Customers with **zero balance churn at 13.82%**.
- Customers with **two products churn the least (8%)**.
- Customers with **3+ products experience high churn (83-100%)**.

 **Recommendation:**
- Encourage **multi-product usage**, but avoid aggressive cross-selling.

---

## **Business Recommendations**
 **Retention Strategy**: Focus on **middle-aged customers** and those with **one product**.

 **Customer Engagement**: Address **inactive members** with personalized offers.

 **Regional Targeting**: Conduct investigations into **Germany’s high churn rate**.

 **Financial Advisory**: Assist customers with **lower credit scores**.

 **Product Strategy**: Promote multi-product usage **without overwhelming customers**.

- **Retention Strategy**: Focus on **40-50 age group** and customers with **one product**
- **Customer Engagement**: Address complaints promptly to reduce churn
- **Geographic Targeting**: Special campaigns for France & Germany
- **Credit Score Consideration**: Identify at-risk customers with moderate credit scores



## **Next Steps**
**Future Improvements:**
- **Explore external factors** (economic trends, competitor offerings).
- **Apply machine learning** to predict churn before it happens.
- **Enhance customer segmentation** to refine retention strategies.




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


