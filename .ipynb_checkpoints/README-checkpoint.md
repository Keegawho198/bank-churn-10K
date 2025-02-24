# bank-churn-10K
Understanding Customer Retention: Churn Prediction with MySQL &amp; Tableau





-- For 0 and 1 values

The dataset itself doesn’t explicitly tell us that 1 = Yes and 0 = No. However, by going through the data, I found that:

1 → Positive/True/Yes 0 → Negative/False/No

Context Clues from Column Names:

HasCrCard: The name suggests it indicates whether a customer has a credit card. It makes sense that 1 would mean Yes (has card) and 0 would mean No (doesn't have card).

IsActiveMember: This sounds like a flag for customer activity. 1 being active (Yes) and 0 being inactive (No) aligns with typical patterns.

Exited: In churn analysis, 1 usually means the customer churned (Yes), and 0 means they stayed (No).

Complain: If a customer made a complaint, 1 for Yes and 0 for No is a common representation.