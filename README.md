# bank-churn-10K
Understanding Customer Retention: Churn Prediction with MySQL &amp; Tableau


Data set Kaggle link:
https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn/data



-- For 0 and 1 values

The dataset itself doesn’t explicitly tell us that 1 = Yes and 0 = No. However, by going through the data, I found that:

1 → Positive/True/Yes 0 → Negative/False/No

Context Clues from Column Names:

HasCrCard: The name suggests it indicates whether a customer has a credit card. It makes sense that 1 would mean Yes (has card) and 0 would mean No (doesn't have card).

IsActiveMember: This sounds like a flag for customer activity. 1 being active (Yes) and 0 being inactive (No) aligns with typical patterns.

Exited: In churn analysis, 1 usually means the customer churned (Yes), and 0 means they stayed (No).

Complain: If a customer made a complaint, 1 for Yes and 0 for No is a common representation.



Notes; As we know, it is much more expensive to sign in a new client than keeping an existing one.

It is advantageous for banks to know what leads a client towards the decision to leave the company.

Churn prevention allows companies to develop loyalty programs and retention campaigns to keep as many customers as possible.


About Dataset
RowNumber—corresponds to the record (row) number and has no effect on the output.
CustomerId—contains random values and has no effect on customer leaving the bank.
Surname—the surname of a customer has no impact on their decision to leave the bank.
CreditScore—can have an effect on customer churn, since a customer with a higher credit score is less likely to leave the bank.
Geography—a customer’s location can affect their decision to leave the bank.
Gender—it’s interesting to explore whether gender plays a role in a customer leaving the bank.
Age—this is certainly relevant, since older customers are less likely to leave their bank than younger ones.
Tenure—refers to the number of years that the customer has been a client of the bank. Normally, older clients are more loyal and less likely to leave a bank.
Balance—also a very good indicator of customer churn, as people with a higher balance in their accounts are less likely to leave the bank compared to those with lower balances.
NumOfProducts—refers to the number of products that a customer has purchased through the bank.
HasCrCard—denotes whether or not a customer has a credit card. This column is also relevant, since people with a credit card are less likely to leave the bank.
IsActiveMember—active customers are less likely to leave the bank.
EstimatedSalary—as with balance, people with lower salaries are more likely to leave the bank compared to those with higher salaries.
Exited—whether or not the customer left the bank.
Complain—customer has complaint or not.
Satisfaction Score—Score provided by the customer for their complaint resolution.
Card Type—type of card hold by the customer.
Points Earned—the points earned by the customer for using credit card.




Resource Learning links

Dealing with duplicates:
https://saturncloud.io/blog/how-to-find-all-duplicate-rows-in-a-pandas-dataframe/#:~:text=To%20find%20duplicate%20rows%20in%20a%20pandas%20dataframe%2C%20we%20can,get%20all%20the%20duplicate%20rows.

Using env file:
https://www.geeksforgeeks.org/how-to-create-and-use-env-files-in-python/

https://dev.to/jakewitcher/using-env-files-for-environment-variables-in-python-applications-55a1





.ENV file

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=   # Replace with your actual password
DB_NAME=CustomerChurn

