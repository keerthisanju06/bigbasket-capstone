-- BigBasket Capstone
-- Part 1: Reporting Queries


-- =========================================================
-- 1. PRODUCT REVENUE TIERS
--
-- High   : Revenue >= ₹3,000
-- Medium : Revenue >= ₹1,000
-- Low    : Revenue < ₹1,000
-- =========================================================

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(
            CASE
                WHEN o.status = 'Delivered'
                THEN o.amount_inr
                ELSE 0
            END
        ) AS total_revenue
    FROM products p
    LEFT JOIN orders o
        ON p.product_id = o.product_id
    GROUP BY
        p.product_id,
        p.product_name
)

SELECT
    product_id,
    product_name,
    total_revenue,
    CASE
        WHEN total_revenue >= 3000
            THEN 'High'
        WHEN total_revenue >= 1000
            THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM product_revenue
ORDER BY total_revenue DESC;


-- =========================================================
-- 2. MONTHLY CATEGORY REVENUE
--
-- This is the EXACT dataset that will be exported as:
-- monthly_category_revenue.csv
--
-- Only Delivered orders are included.
-- =========================================================

SELECT
    p.category AS category,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY
    p.category,
    strftime('%Y-%m', o.order_date)
ORDER BY
    p.category,
    month;


-- =========================================================
-- 3. CATEGORY REVENUE VS TARGET
--
-- Variance = Target - Actual Revenue
--
-- Percentage Variance:
-- ((Revenue - Target) / Target) * 100
--
-- Above Target:
-- Revenue >= Target
--
-- Watch:
-- Shortfall <= 15% of Target
--
-- Critical:
-- Shortfall > 15% of Target
-- =========================================================

WITH category_revenue AS (
    SELECT
        p.category,
        SUM(o.amount_inr) AS total_revenue
    FROM orders o
    INNER JOIN products p
        ON o.product_id = p.product_id
    WHERE o.status = 'Delivered'
    GROUP BY p.category
)

SELECT
    cr.category,
    ct.target_revenue_inr,
    cr.total_revenue,

    ct.target_revenue_inr - cr.total_revenue
        AS variance,

    ((cr.total_revenue - ct.target_revenue_inr) * 100.0)
        / ct.target_revenue_inr
        AS percentage_variance,

    CASE
        WHEN cr.total_revenue >= ct.target_revenue_inr
            THEN 'Above Target'

        WHEN (ct.target_revenue_inr - cr.total_revenue)
             <= ct.target_revenue_inr * 0.15
            THEN 'Below Target - Watch'

        ELSE 'Below Target - Critical'
    END AS target_status

FROM category_revenue cr
INNER JOIN category_targets ct
    ON cr.category = ct.category

ORDER BY cr.total_revenue DESC;