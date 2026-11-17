# Loan Default Risk Dashboard

An interactive Power BI dashboard that analyzes default risk across **32,581 loans**. The data was cleaned in Power Query and the calculations were built in DAX.

![Loan Default Risk Dashboard]<img width="1408" height="788" alt="image" src="https://github.com/user-attachments/assets/30bf22fb-1e44-46a5-810f-5d7697aa71f1" />

## Objective
To understand which loan and borrower characteristics (loan grade, loan purpose, income, age and employment length) are linked to loan default, so that high-risk segments can be identified early.

##  Tools Used
| Tool | Purpose |
|---|---|
| Power Query | Data cleaning and transformation |
| Power BI | Dashboard design and visualization |
| DAX | Calculated columns and measures |

## Dataset
- **Source:** Credit Risk Dataset from Kaggle ([dataset link])
- **Size:** 32,581 loan records
- **Key fields:** loan grade, loan intent, loan amount, interest rate, borrower income, age, employment length, home ownership, credit history and loan status (default or non-default)

##  Key Metrics
| Metric | Value |
|---|---|
| Total Loans | 32,581 |
| Defaulted Loans | 7,108 |
| Default Rate | 21.8% |
| Total Loan Amount | $312.4M |

##  Key Insights
- **Default rate rises sharply as loan grade worsens:** from 10.0% (Grade A) to 98.4% (Grade G).
- **Debt consolidation loans default the most (28.6%),** followed by medical (26.7%) and home improvement (26.1%) loans. Venture loans default the least (14.8%).
- **Lower income means higher risk:** the default rate is 47.1% for borrowers earning under $30k, compared with 8.9% for those earning over $100k.

##  Dashboard Features
- **KPI cards:** total loans, defaulted loans, default rate and total loan amount
- **Interactive filters:** loan grade, loan purpose, income group, age group and employment length
- **Default rate by loan grade:** non-default vs default comparison for grades A to G
- **Default rate by loan intent:** which loan purposes carry the most risk
- **Default risk by income group:** loan counts with a default rate trend line
- **Loan status distribution:** share of defaulted vs non-defaulted loans
- **Key Insights panel** summarizing the main findings

##  Data Preparation (Power Query)
- [Step 1: e.g. checked for missing values and handled them]
- [Step 2: e.g. corrected column data types]
- [Step 3: e.g. renamed loan intent values to readable names]
- [Step 4: e.g. removed duplicates or unrealistic values, if you did]

## DAX Used
**Income Group** (calculated column)
```dax
Income Group = 
SWITCH(
    TRUE(),
    'credit_risk_dataset'[person_income] < 30000, "< $30k",
    'credit_risk_dataset'[person_income] < 50000, "$30k - $50k",
    'credit_risk_dataset'[person_income] < 75000, "$50k - $75k",
    'credit_risk_dataset'[person_income] < 100000, "$75k - $100k",
    "> $100k"
)
```

**Income Group Sort** (calculated column, used with *Sort by column* to keep income groups in order)
```dax
Income Group Sort = 
SWITCH(
    TRUE(),
    'credit_risk_dataset'[person_income] < 30000, 1,
    'credit_risk_dataset'[person_income] < 50000, 2,
    'credit_risk_dataset'[person_income] < 75000, 3,
    'credit_risk_dataset'[person_income] < 100000, 4,
    5
)
```

**Default Rate** (measure)
```dax
[paste your own Default Rate measure here]
```

## Repository Files
- `Loan_Default_Dashboard.pbix`: Power BI file
- `dashboard.png`: dashboard screenshot
- `credit_risk_dataset.csv`: source dataset (Kaggle)
- `README.md`: project documentation

##  How to Open
1. Download `Loan_Default_Dashboard.pbix`.
2. Open it in **Power BI Desktop** (free to download from Microsoft).
3. Use the filters on the left to explore the data.

##  What I Learned
- Cleaning and transforming data in Power Query
- Writing DAX calculated columns and measures
- Sorting a text column with a helper sort column
- Designing a clean dashboard with consistent colors and layout
- Turning data into clear business insights

##  Author
**R Janvi**
B.Tech CSE (Data Science) 
