# Data Dictionary

**Dataset:** Credit Risk Dataset (Kaggle)
**File:** `credit_risk_dataset.csv`
**Size:** 32,581 rows, 12 columns
**Target column:** `loan_status` (1 = default, 0 = non-default)

## Original columns

| Column | Type | Description | Values / Range in this dataset |
|---|---|---|---|
| `person_age` | Integer | Age of the borrower (years) | 20 to 144 |
| `person_income` | Integer | Annual income of the borrower ($) | 4,000 to 6,000,000 |
| `person_home_ownership` | Text | Home ownership status | RENT, MORTGAGE, OWN, OTHER |
| `person_emp_length` | Decimal | Employment length (years) | 0 to 123 |
| `loan_intent` | Text | Purpose of the loan | EDUCATION, MEDICAL, VENTURE, PERSONAL, DEBTCONSOLIDATION, HOMEIMPROVEMENT |
| `loan_grade` | Text | Loan grade, from A (lowest risk) to G (highest risk) | A, B, C, D, E, F, G |
| `loan_amnt` | Integer | Loan amount ($) | 500 to 35,000 |
| `loan_int_rate` | Decimal | Interest rate of the loan (%) | 5.42 to 23.22 |
| `loan_status` | Integer | Loan outcome: 1 = default, 0 = non-default | 0 (25,473 loans), 1 (7,108 loans) |
| `loan_percent_income` | Decimal | Loan amount as a share of the borrower's income | 0.00 to 0.83 |
| `cb_person_default_on_file` | Text | Whether the borrower has a past default on file | Y (5,745), N (26,836) |
| `cb_person_cred_hist_length` | Integer | Length of the borrower's credit history (years) | 2 to 30 |

## Data quality notes (raw file)

| Column | Observation |
|---|---|
| `person_emp_length` | 895 missing values; a maximum of 123 years looks unrealistic |
| `loan_int_rate` | 3,116 missing values |
| `person_age` | A maximum of 144 years looks unrealistic |

[Add one line here about how you handled these in SQL or Power Query, for example: "Missing values were checked in `01_Data_Quality_Checks.sql` and handled in Power Query."]

## Fields created for the dashboard

### Columns

| Name | Description |
|---|---|
| `Income Group` | Income bands: `< $30k`, `$30k - $50k`, `$50k - $75k`, `$75k - $100k`, `> $100k` (DAX calculated column) |
| `Income Group Sort` | Numbers 1 to 5 used with *Sort by column* so income groups appear in the correct order (DAX calculated column) |
| `Age Group` | [Describe your age bands, e.g. 20-25, 26-35 ...] |
| `Loan Status Label` | Text label for `loan_status`: Defaulted / Non-Defaulted |

### Measures

| Name | Description |
|---|---|
| `Total Loans` | Number of loan records (32,581) |
| `Defaulted Loans` | Number of loans with `loan_status` = 1 (7,108) |
| `Default Rate` | Defaulted loans divided by total loans (21.8%) |
| `Non-Default Rate` | Share of loans that did not default (78.2%) |
| `Total Loan Amount` | Sum of `loan_amnt` ($312.4M) |

## Notes

- `loan_intent` values are stored in capital letters in the raw file (for example `DEBTCONSOLIDATION`) and are shown as readable names in the dashboard (for example "Debt Consolidation").
- Please check the measure and column descriptions against your own DAX in the Power BI file.
