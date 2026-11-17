--Query 1 — Default rate by age group
--Business question: Which age groups have higher observed default rates?

USE LoanRiskDB;
GO

SELECT
    CASE
        WHEN person_age < 25 THEN 'Below 25'
        WHEN person_age < 35 THEN '25-34'
        WHEN person_age < 45 THEN '35-44'
        WHEN person_age < 55 THEN '45-54'
        ELSE '55 and Above'
    END AS Age_Group,
    COUNT(*) AS Total_Loans,
    SUM(CAST(loan_status AS INT)) AS Defaulted_Loans,
    CAST(
        AVG(CAST(loan_status AS FLOAT)) * 100
        AS DECIMAL(5,2)
    ) AS Default_Rate_Percentage
FROM dbo.credit_risk_dataset
GROUP BY
    CASE
        WHEN person_age < 25 THEN 'Below 25'
        WHEN person_age < 35 THEN '25-34'
        WHEN person_age < 45 THEN '35-44'
        WHEN person_age < 55 THEN '45-54'
        ELSE '55 and Above'
    END
ORDER BY MIN(person_age);



--Query 2 — Default rate by income group
--Business question: How does the default rate vary across annual income groups?

SELECT
    CASE
        WHEN person_income < 30000 THEN 'Below 30K'
        WHEN person_income < 60000 THEN '30K-59K'
        WHEN person_income < 100000 THEN '60K-99K'
        ELSE '100K and Above'
    END AS Income_Group,
    COUNT(*) AS Total_Loans,
    SUM(CAST(loan_status AS INT)) AS Defaulted_Loans,
    CAST(
        AVG(CAST(loan_status AS FLOAT)) * 100
        AS DECIMAL(5,2)
    ) AS Default_Rate_Percentage
FROM dbo.credit_risk_dataset
WHERE person_income IS NOT NULL
GROUP BY
    CASE
        WHEN person_income < 30000 THEN 'Below 30K'
        WHEN person_income < 60000 THEN '30K-59K'
        WHEN person_income < 100000 THEN '60K-99K'
        ELSE '100K and Above'
    END
ORDER BY MIN(person_income);



--Query 3 — Default rate by loan-to-income ratio
--loan_percent_income represents the loan amount as a proportion of the borrower's annual income.
--Business question: Do records with a larger loan relative to income have higher default rates?

SELECT
    CASE
        WHEN loan_percent_income < 0.10 THEN 'Below 10%'
        WHEN loan_percent_income < 0.20 THEN '10%-19.99%'
        WHEN loan_percent_income < 0.30 THEN '20%-29.99%'
        ELSE '30% and Above'
    END AS Loan_Income_Range,
    COUNT(*) AS Total_Loans,
    SUM(CAST(loan_status AS INT)) AS Defaulted_Loans,
    CAST(
        AVG(CAST(loan_status AS FLOAT)) * 100
        AS DECIMAL(5,2)
    ) AS Default_Rate_Percentage
FROM dbo.credit_risk_dataset
WHERE loan_percent_income IS NOT NULL
GROUP BY
    CASE
        WHEN loan_percent_income < 0.10 THEN 'Below 10%'
        WHEN loan_percent_income < 0.20 THEN '10%-19.99%'
        WHEN loan_percent_income < 0.30 THEN '20%-29.99%'
        ELSE '30% and Above'
    END
ORDER BY MIN(loan_percent_income);



--Query 4 — Default rate by previous default history
--Business question: Does the recorded previous default indicator vary with current loan default rates?

SELECT
    cb_person_default_on_file AS Previous_Default_History,
    COUNT(*) AS Total_Loans,
    SUM(CAST(loan_status AS INT)) AS Defaulted_Loans,
    CAST(
        AVG(CAST(loan_status AS FLOAT)) * 100
        AS DECIMAL(5,2)
    ) AS Default_Rate_Percentage
FROM dbo.credit_risk_dataset
GROUP BY cb_person_default_on_file
ORDER BY cb_person_default_on_file;



--Query 5 — Default rate by employment length
--Business question: How does observed default rate vary with years of employment?

SELECT
    CASE
        WHEN person_emp_length < 2 THEN 'Less than 2 years'
        WHEN person_emp_length < 5 THEN '2-4 years'
        WHEN person_emp_length < 10 THEN '5-9 years'
        ELSE '10+ years'
    END AS Employment_Group,
    COUNT(*) AS Total_Loans,
    SUM(CAST(loan_status AS INT)) AS Defaulted_Loans,
    CAST(
        AVG(CAST(loan_status AS FLOAT)) * 100
        AS DECIMAL(5,2)
    ) AS Default_Rate_Percentage
FROM dbo.credit_risk_dataset
WHERE person_emp_length IS NOT NULL
GROUP BY
    CASE
        WHEN person_emp_length < 2 THEN 'Less than 2 years'
        WHEN person_emp_length < 5 THEN '2-4 years'
        WHEN person_emp_length < 10 THEN '5-9 years'
        ELSE '10+ years'
    END