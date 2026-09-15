-- BigBasket Capstone
-- Part 1: SQL Foundations


-- =========================================================
-- 1. SELECT + WHERE
-- Find all orders placed by customers from Bengaluru
-- =========================================================

SELECT *
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.city = 'Bengaluru';


-- =========================================================
-- 2. DISTINCT
-- Display all unique product categories
-- =========================================================

SELECT DISTINCT category
FROM products
ORDER BY category;


-- =========================================================
-- 3. ORDER BY + LIMIT
-- Find the 5 highest-value orders
-- =========================================================

SELECT
    order_id,
    amount_inr
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;


-- =========================================================
-- 4. ALIAS (AS)
-- Count orders for each status
-- =========================================================

SELECT
    status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY status;


-- =========================================================
-- 5. IN
-- Find orders paid using UPI or Credit Card
-- =========================================================

SELECT *
FROM orders
WHERE payment_mode IN ('UPI', 'Credit Card');


-- =========================================================
-- 6. BETWEEN
-- Find orders with amount between ₹100 and ₹500
-- =========================================================

SELECT *
FROM orders
WHERE amount_inr BETWEEN 100 AND 500;


-- =========================================================
-- 7. NOT BETWEEN
-- Find orders whose amount is outside ₹100–₹500
-- =========================================================

SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 100 AND 500;


-- =========================================================
-- 8. IS NULL
-- Find orders where rating is not available
-- =========================================================

SELECT *
FROM orders
WHERE rating IS NULL;