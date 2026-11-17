-- KPI Analysis for your Loan Default Risk Dashboard
-- KPI 1: Total Loans
SELECT
    COUNT(*) AS Total_Loans
FROM dbo.credit_risk_dataset;

-- KPI 2: Defaulted Loans
SELECT
    SUM(CAST(loan_status AS INT)) AS Defaulted_Loans
FROM dbo.credit_risk_dataset;

-- KPI 3: Overall Default Rate
SELECT
    CAST(
        AVG(CAST(loan_status AS FLOAT)) * 100
        AS DECIMAL(5,2)
    ) AS Default_Rate_Percentage
FROM dbo.credit_risk_dataset;



-- KPI 4: Total Loan Amount
SELECT
    SUM(loan_amnt) AS Total_Loan_Amount
FROM dbo.credit_risk_dataset;

-- KPI 5: Amount associated with defaulted loans
SELECT
    SUM(CASE
        WHEN loan_status = 1 THEN loan_amnt
        ELSE 0
    END) AS Defaulted_Loan_Amount
FROM dbo.credit_risk_dataset;


-- Compare default and non-default loans
SELECT
    CASE
        WHEN loan_status = 1 THEN 'Default'
        ELSE 'Non-Default'
    END AS Loan_Category,
    COUNT(*) AS Total_Loans,
    SUM(loan_amnt) AS Total_Loan_Amount,
    CAST(
        AVG(CAST(loan_amnt AS FLOAT))
        AS DECIMAL(12,2)
    ) AS Average_Loan_Amount
FROM dbo.credit_risk_dataset
GROUP BY loan_status
ORDER BY loan_status;

