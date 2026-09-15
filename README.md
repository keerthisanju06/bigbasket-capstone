# BigBasket Category Revenue Diagnostic

## Project Overview

This project performs a connected diagnostic analysis of BigBasket category revenue using SQL, spreadsheet analysis, Tableau Public and Pandas.

The project identifies category revenue performance, compares revenue against category targets, analyzes monthly revenue trends and independently validates the findings using deliberately messy raw order data.

The project follows a connected workflow where the SQL analysis produces the monthly category revenue dataset used in the spreadsheet and Tableau analysis, while the Pandas analysis independently cleans and validates the raw data.

---

## Project Structure

```text
bigbasket-capstone/
├── generate_data.py
├── bigbasket_capstone.db
├── orders_raw.csv
├── products.csv
├── verify.sql
├── 01_foundations.sql
├── 02_aggregation_joins.sql
├── 03_reporting.sql
├── monthly_category_revenue.csv
├── bigbasket_category_analysis.xlsx
├── analysis.ipynb
├── ai_log.md
├── DATA_STORY.md
└── README.md



---

# Part 1 – SQL Analysis

SQLite was used to perform the foundational SQL and revenue diagnostic analysis.

The SQL analysis includes:

- SELECT and WHERE
- DISTINCT
- ORDER BY and LIMIT
- Column aliases using AS
- IN conditions
- BETWEEN and NOT BETWEEN
- IS NULL
- INNER JOIN
- LEFT JOIN
- GROUP BY
- COUNT, SUM and AVG
- HAVING
- Product revenue tiers
- Monthly category revenue
- Category revenue versus target analysis

## Database Control Results

| Metric | Result |
|---|---:|
| Products | 31 |
| Customers | 50 |
| Orders | 500 |
| Delivered Orders | 434 |
| Cancelled Orders | 42 |
| Pending Orders | 24 |
| Category Targets | 6 |
| Delivered Revenue | ₹88,282 |

## Delivered Revenue by Category

| Category | Revenue |
|---|---:|
| Household Essentials | ₹21,715 |
| Personal Care | ₹16,382 |
| Bakery | ₹15,410 |
| Dairy & Eggs | ₹14,090 |
| Snacks & Beverages | ₹10,895 |
| Fruits & Vegetables | ₹9,790 |
| **Grand Total** | **₹88,282** |

## SQL Files

- `verify.sql` – verifies database counts and order status totals
- `01_foundations.sql` – foundational SQL queries
- `02_aggregation_joins.sql` – aggregation and join analysis
- `03_reporting.sql` – reporting, monthly revenue and target analysis

The exact monthly category revenue output is stored in:

`monthly_category_revenue.csv`

The file contains 36 rows representing 6 categories across 6 months.

---

# Part 2 – Spreadsheet Analysis

The exact SQL-generated `monthly_category_revenue.csv` was imported into the spreadsheet workbook.

## Workbook

`bigbasket_category_analysis.xlsx`

## Workbook Sheets

- Monthly Data
- Category Targets
- Pivot Table
- Category Summary

The Pivot Table reconciles with the Part 1 SQL results:

- Total Revenue = ₹88,282
- Delivered Orders = 434

The Category Summary compares actual revenue with category targets and calculates:

- Total Revenue
- Target Revenue
- Variance
- Percentage Variance
- Target Status
- SQL reconciliation

All six category totals match the Part 1 SQL totals.

## Target Performance

| Category | Revenue | Target | Status |
|---|---:|---:|---|
| Household Essentials | ₹21,715 | ₹17,000 | Above Target |
| Personal Care | ₹16,382 | ₹15,500 | Above Target |
| Bakery | ₹15,410 | ₹12,000 | Above Target |
| Dairy & Eggs | ₹14,090 | ₹16,500 | Below Target - Watch |
| Snacks & Beverages | ₹10,895 | ₹13,000 | Below Target - Critical |
| Fruits & Vegetables | ₹9,790 | ₹12,000 | Below Target - Critical |

---

# Part 3 – Tableau Public Dashboard

The same `monthly_category_revenue.csv` generated from Part 1 SQL was used to create the Tableau Public dashboard.

## Dashboard Components

The dashboard contains:

- Total Revenue KPI
- Delivered Orders KPI
- Average Order Value KPI
- Categories Meeting Target KPI
- Monthly Delivered Revenue trend
- Category Revenue vs Target Performance
- Target-status color coding
- Interactive category filtering
- Visible target-status legend

## Key Dashboard KPIs

| KPI | Value |
|---|---:|
| Total Revenue | ₹88,282 |
| Delivered Orders | 434 |
| Average Order Value | ₹203.41 |
| Categories Meeting Target | 3 |

## Tableau Public Dashboard



---

# Part 3 – Data Story

## Overall Performance

The analysis covers delivered BigBasket orders from January to June 2026.

Total delivered revenue was **₹88,282** from **434 delivered orders**, giving an average order value of approximately **₹203.41**.

Three of the six categories met or exceeded their revenue targets, while three categories were below target.

### Household Essentials

Household Essentials generated **₹21,715** in delivered revenue against a target of **₹17,000**.

- Variance: ₹4,715 above target
- Percentage variance: 27.74%
- Status: Above Target

It is the highest-revenue category and the strongest contributor to total delivered revenue.

### Personal Care

Personal Care generated **₹16,382** against a target of **₹15,500**.

- Variance: ₹882 above target
- Percentage variance: 5.69%
- Status: Above Target

Personal Care is performing above target, although its surplus over target is relatively small.

### Bakery

Bakery generated **₹15,410** against a target of **₹12,000**.

- Variance: ₹3,410 above target
- Percentage variance: 28.42%
- Status: Above Target

Bakery shows strong performance and has one of the highest percentage surpluses over target.

### Dairy & Eggs

Dairy & Eggs generated **₹14,090** against a target of **₹16,500**.

- Variance: ₹2,410 below target
- Percentage variance: -14.61%
- Status: Below Target - Watch

The category is close to its target but requires monitoring and improvement.

### Snacks & Beverages

Snacks & Beverages generated **₹10,895** against a target of **₹13,000**.

- Variance: ₹2,105 below target
- Percentage variance: -16.19%
- Status: Below Target - Critical

The category is more than 15% below target and requires corrective action.

### Fruits & Vegetables

Fruits & Vegetables generated **₹9,790** against a target of **₹12,000**.

- Variance: ₹2,210 below target
- Percentage variance: -18.42%
- Status: Below Target - Critical

It is the lowest-revenue category and has the largest percentage shortfall against its target.

## Recommendations

### Recommendation 1 – Improve Fruits & Vegetables

Fruits & Vegetables is **₹2,210 below its ₹12,000 target** and has an **18.42% shortfall**.

Management should investigate product availability, pricing, customer demand and product-level performance. Targeted promotions and assortment improvements can be considered to increase revenue.

### Recommendation 2 – Improve Snacks & Beverages

Snacks & Beverages is **₹2,105 below its ₹13,000 target** and is **16.19% below target**.

The category should be prioritized for promotional campaigns, bundle offers and investigation of low-performing products to improve delivered revenue.

---

# Part 4 – Pandas Diagnostic Analysis

The raw `orders_raw.csv` file contains deliberately messy data designed for independent data cleaning and diagnostic analysis.

The data contains:

- Duplicate order records
- Mixed casing and whitespace in city and category
- Missing order amounts
- Suspiciously large amount values

Pandas is used to independently clean and analyze the raw data.

## Cleaning and Analysis Steps

The notebook performs:

1. Initial data inspection
2. Data quality assessment
3. Duplicate removal using `order_id`
4. City standardization
5. Category standardization
6. Missing amount analysis
7. IQR-based outlier detection
8. Outlier capping
9. Date parsing
10. Monthly analysis
11. Delivered revenue by category
12. Supplier revenue analysis
13. Cross-validation against Part 1 SQL
14. Matplotlib visualizations
15. Diagnostic insights and recommendations

## Expected Validation Results

After cleaning:

- 500 unique orders remain
- City values are standardized to four canonical cities
- Category values are standardized to six canonical categories
- Missing amounts are excluded from revenue calculations
- Suspicious high values are capped using the IQR upper fence
- The top category is **Household Essentials**
- The top supplier is **HomeEssentials Traders**

Exact rupee totals from Part 4 may differ from Part 1 because Part 4 uses the deliberately messy raw data and applies cleaning and outlier capping.

## Notebook

`analysis.ipynb`

---

# AI Usage

AI assistance was used during the project for SQL query development, spreadsheet formulas, Tableau calculations and Pandas analysis.

The prompts, constraints and actual verification steps are documented in:

`ai_log.md`

---

# Reproducibility

The dataset was generated using a deterministic Python script.

To regenerate the SQLite database and raw CSV files, run:

```bash
python generate_data.py