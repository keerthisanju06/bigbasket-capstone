# AI Usage Log

## Prompt 1 — SQL and Data Analysis

### Role
Act as a senior SQL and data analytics mentor.

### Context
I am completing a BigBasket Category Revenue Diagnostic project using a deterministic SQLite database containing products, customers, orders and category targets.

### Task
Help me design and verify SQL queries for foundational SQL, aggregation, joins, product revenue tiers, monthly category revenue and category target comparison.

### Constraints
Use SQLite-compatible SQL. Delivered orders must be used for revenue analysis. The monthly category revenue output must contain exactly 36 rows and must reconcile to total delivered revenue of ₹88,282.

### Format
Provide runnable SQL queries with clear comments and explain the expected results.

### Verification Performed
I executed the SQL queries against `bigbasket_capstone.db`, verified the database counts and status totals, and verified that the exported `monthly_category_revenue.csv` contains 36 rows with total revenue of ₹88,282.

---

## Prompt 2 — Pandas Data Cleaning and Diagnostic Analysis

### Role
Act as a senior Python and Pandas data analyst.

### Context
I am completing Part 4 of a BigBasket Category Revenue Diagnostic project using deliberately messy `orders_raw.csv` and the reference `products.csv`.

### Task
Help me clean the raw order data, handle duplicates, normalize text, investigate missing and suspicious amounts using IQR, cap extreme values, calculate delivered revenue by category and supplier, and create diagnostic visualizations.

### Constraints
Do not fill missing revenue values. Remove duplicate orders using order_id and keep the first record. Normalize city and category using strip and title. Use IQR capping rather than deleting suspicious values. Preserve legitimate null ratings. The top category and top supplier must be cross-validated against Part 1 SQL.

### Format
Provide executable Pandas code with explanations, validation checks, charts and exactly three actionable insights.

### Verification Performed
I will verify that the cleaned dataset contains 500 unique orders, that canonical city and category values are restored, and that the top category is Household Essentials and the top supplier is HomeEssentials Traders. Exact rupee totals may differ from Part 1 because Part 4 uses cleaned and capped raw data.