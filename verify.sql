-- BigBasket Capstone - Database Verification
--
-- Expected results:
-- products = 31
-- customers = 50
-- orders = 500
-- category_targets = 6
--
-- Expected order status counts:
-- Delivered = 434
-- Cancelled = 42
-- Pending = 24


-- 1. Count products
SELECT COUNT(*) AS product_count
FROM products;


-- 2. Count customers
SELECT COUNT(*) AS customer_count
FROM customers;


-- 3. Count orders
SELECT COUNT(*) AS order_count
FROM orders;


-- 4. Count category targets
SELECT COUNT(*) AS target_count
FROM category_targets;


-- 5. Count orders by status
SELECT
    status,
    COUNT(*) AS status_count
FROM orders
GROUP BY status
ORDER BY status;