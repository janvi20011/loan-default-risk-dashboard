-- Project Loan Default Risk Dashboard
-- Scripts : Data Quality Checks

-- Checking Total Number of records

SELECT COUNT(*) AS Total_No_loans
FROM dbo.credit_risk_dataset;

-- Checking Missing Values in important records
SELECT 
SUM (CASE WHEN person_age IS NULL THEN 1 ELSE 0 END) 
AS mising_age,
SUM (CASE WHEN person_income IS NULL THEN 1 ELSE 0 END)
AS mising_income,
SUM(CASE WHEN loan_amnt IS NULL THEN 1 ELSE 0 END)
AS miising_loan_amt,
SUM(CASE WHEN loan_status IS NULL THEN 1 ELSE 0 END)
AS missing_loan_status
FROM dbo.credit_risk_dataset;

-- Check thhe loan status distribution 
SELECT
loan_status,
COUNT(*) AS loan_count
FROM dbo.credit_risk_dataset
GROUP BY loan_status
ORDER BY loan_status;