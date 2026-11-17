-- Exploratory Data Analysis (EDA)


-- 1. Loan Status distribution 
--What percentage of applicants defaulted versus did not default?
--- 0 = Non-default
--- 1 = Default
SELECT
loan_status,
COUNT(*)AS total_loans,
CAST(COUNT(*)*100.0 / SUM(COUNT(*)) OVER() AS  DECIMAL(5,2)) AS Percentage_01
FROM dbo.credit_risk_dataset
GROUP BY loan_status
ORDER BY loan_status;


-- Default rate By Loan grade
SELECT
loan_grade,
COUNT(*) AS Total_loan_grade,
SUM(CAST(loan_status AS INT)) AS Defaulted_Loans,
    CAST(
        AVG(CAST(loan_status AS FLOAT)) * 100
        AS DECIMAL(5,2)
    ) AS Default_Rate_Percentage
FROM dbo.credit_risk_dataset
GROUP BY loan_grade
ORDER BY Default_Rate_Percentage desc;

-- Default Rate By loan purpose 
SELECT 
loan_intent,
COUNT(*) AS Total_loan_intent,
SUM(CAST(loan_status AS INT)) AS Defaulted_Loans,
    CAST(
        AVG(CAST(loan_status AS FLOAT)) * 100
        AS DECIMAL(5,2)
    ) AS Default_Rate_Percentage
FROM dbo.credit_risk_dataset
GROUP BY loan_intent
ORDER BY Default_Rate_Percentage DESC;


-- Default rate by home ownership
SELECT 
person_home_ownership,
COUNT(*) AS Total_loans,
CAST(
        AVG(CAST(loan_status AS FLOAT)) * 100
        AS DECIMAL(5,2)
    ) AS Default_Rate_Percentage
FROM dbo.credit_risk_dataset
GROUP BY person_home_ownership
ORDER BY Default_Rate_Percentage Desc;

-- 5. Default rate by interest-rate range
SELECT
    CASE
        WHEN loan_int_rate < 10 THEN 'Below 10%'
        WHEN loan_int_rate < 15 THEN '10% to below 15%'
        WHEN loan_int_rate < 20 THEN '15% to below 20%'
        ELSE '20% and above'
    END AS Interest_Rate_Range,
    COUNT(*) AS Total_Loans,
    CAST(
        AVG(CAST(loan_status AS FLOAT)) * 100
        AS DECIMAL(5,2)
    ) AS Default_Rate_Percentage
FROM dbo.credit_risk_dataset
WHERE loan_int_rate IS NOT NULL
GROUP BY
    CASE
        WHEN loan_int_rate < 10 THEN 'Below 10%'
        WHEN loan_int_rate < 15 THEN '10% to below 15%'
        WHEN loan_int_rate < 20 THEN '15% to below 20%'
        ELSE '20% and above'
    END
ORDER BY MIN(loan_int_rate);