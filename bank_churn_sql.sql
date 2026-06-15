USE [bank_customer_churn]
GO

-- 1. What are the key differences in average metrics between customers who left and those who stayed?
-- CHURNER VS. RETAINED PROFILE
SELECT
    CASE WHEN exited = 1 THEN 'Churned' ELSE 'Retained' END AS customer_status,
    COUNT(*) AS total,
    ROUND(AVG(CAST(age AS FLOAT)), 1) AS avg_age,
    ROUND(AVG(CAST(credit_score AS FLOAT)), 0) AS avg_credit_score,
    ROUND(AVG(balance), 0) AS avg_balance,
    ROUND(AVG(CAST(tenure AS FLOAT)), 1) AS avg_tenure_yrs,
    ROUND(AVG(CAST(is_active_member AS FLOAT)) * 100, 1) AS pct_active
FROM bank_churn
GROUP BY exited;

-- 2. Which combination of geography, gender, and age group presents the highest churn risk?
SELECT [geography], [gender], [age_group],
	COUNT(*) AS total_customers, 
	SUM([exited]) AS total_churned, 
	CAST(SUM([exited]) AS FLOAT) / COUNT(*) AS churn_rate_pct
FROM [dbo].[bank_churn]
GROUP BY geography, gender, age_group
HAVING COUNT(*) >= 30
ORDER BY churn_rate_pct DESC;

-- 3. Does holding more bank products increase customer loyalty or drive churn?
SELECT [num_of_products],
    COUNT(*) AS total_customers,
    SUM(exited) AS total_churned,
    ROUND(100.0 * SUM(exited) / COUNT(*), 1) AS churn_rate_pct
FROM bank_churn
GROUP BY num_of_products
ORDER BY num_of_products;

-- 4. How do account activity and balance size together impact the likelihood of churning?
SELECT
    CASE WHEN is_active_member = 1 THEN 'Active' ELSE 'Inactive' END AS engagement,
    CASE WHEN balance = 0 THEN 'Zero'
         WHEN balance <= 100000 THEN 'Mid'
         ELSE 'High'
    END AS balance_tier,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned,
    ROUND(100.0 * SUM(exited) / COUNT(*), 1) AS churn_rate_pct
FROM bank_churn
GROUP BY
    is_active_member,
    CASE
        WHEN balance = 0 THEN 'Zero'
        WHEN balance <= 100000 THEN 'Mid'
        ELSE 'High'
    END
ORDER BY engagement DESC, churn_rate_pct DESC;
 
-- 5. What is the financial impact of churn in terms of lost account balances by region?
WITH bank_total AS (
    SELECT SUM(balance) AS total_balance FROM bank_churn
)
SELECT
    geography,
    COUNT(CASE WHEN exited = 1 THEN 1 END) AS customers_lost,
    ROUND(SUM(CASE WHEN exited = 1 THEN balance ELSE 0 END), 0) AS balance_lost,
    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN balance ELSE 0 END)
        / (SELECT total_balance FROM bank_total), 1
    ) AS pct_of_total_balance
FROM bank_churn
GROUP BY geography
ORDER BY balance_lost DESC;