-- =============================================
-- Shopping Trends Analysis — SQL Queries
-- Author: Anton
-- Dataset: 3,900 retail transactions
-- =============================================

-- 1. Revenue by Category
SELECT 
    Category,
    COUNT(*) AS total_transactions,
    ROUND(SUM("Purchase Amount (USD)"), 2) AS total_revenue,
    ROUND(AVG("Purchase Amount (USD)"), 2) AS avg_purchase
FROM shopping_trends
GROUP BY Category
ORDER BY total_revenue DESC;

-- 2. Revenue by Season
SELECT 
    Season,
    COUNT(*) AS total_transactions,
    ROUND(SUM("Purchase Amount (USD)"), 2) AS total_revenue,
    ROUND(AVG("Purchase Amount (USD)"), 2) AS avg_check
FROM shopping_trends st
GROUP BY Season
ORDER BY total_revenue DESC;

-- 3. Revenue by Age Group
SELECT 
    COUNT(*) AS total_customer,
    ROUND(SUM("Purchase Amount (USD)"), 2) AS total_revenue,
    ROUND(AVG("Purchase Amount (USD)"), 2) AS avg_check,
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56-70'
    END AS age_group
FROM shopping_trends st
GROUP BY age_group
ORDER BY total_revenue DESC;

-- 4. Subscription Impact
SELECT
    "Subscription Status",
    COUNT(*) AS total_customer,
    ROUND(AVG("Purchase Amount (USD)"), 2) AS avg_check,
    ROUND(SUM("Purchase Amount (USD)"), 2) AS total_revenue
FROM shopping_trends st
GROUP BY "Subscription Status"
ORDER BY avg_check;

-- 5. Discount Impact
SELECT
    "Discount Applied",
    COUNT(*) AS total_transactions,
    ROUND(AVG("Purchase Amount (USD)"), 2) AS avg_check,
    ROUND(SUM("Purchase Amount (USD)"), 2) AS total_revenue
FROM shopping_trends st
GROUP BY "Discount Applied"
ORDER BY avg_check;

-- 6. Rating by Category
SELECT
    Category,
    COUNT(*) AS total_transactions,
    ROUND(SUM("Purchase Amount (USD)"), 2) AS total_revenue,
    ROUND(AVG("Review Rating"), 2) AS avg_rating
FROM shopping_trends st
GROUP BY Category
ORDER BY avg_rating DESC;

-- 7. Top 10 Products by Revenue
SELECT
    "Item Purchased",
    COUNT(*) AS total_sell,
    ROUND(SUM("Purchase Amount (USD)"), 2) AS total_revenue,
    ROUND(AVG("Review Rating"), 2) AS avg_rating
FROM shopping_trends st
GROUP BY "Item Purchased"
ORDER BY total_revenue DESC
LIMIT 10;
