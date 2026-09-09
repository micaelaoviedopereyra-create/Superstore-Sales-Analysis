-- Superstore Sales & Profitability Analysis
-- SQL analysis using the Superstore dataset

-- 1. Sales and profit by category
SELECT
    "Category",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit
FROM orders
GROUP BY "Category"
ORDER BY total_sales DESC;


-- 2. Products with negative profitability
SELECT
    "Product Name",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit
FROM orders
GROUP BY "Product Name"
HAVING SUM("Profit") < 0
ORDER BY total_profit ASC
LIMIT 10;


-- 3. Discount vs. profitability
SELECT
    ROUND("Discount", 2) AS discount,
    COUNT(*) AS orders,
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit
FROM orders
GROUP BY ROUND("Discount", 2)
ORDER BY discount;


-- 4. Top 10 customers by sales
SELECT
    "Customer Name",
    ROUND(SUM("Sales"), 2) AS total_sales,
    ROUND(SUM("Profit"), 2) AS total_profit
FROM orders
GROUP BY "Customer Name"
ORDER BY total_sales DESC
LIMIT 10;


-- 5. Product sales ranking within each category
SELECT
    "Category",
    "Product Name",
    ROUND(SUM("Sales"), 2) AS total_sales,
    RANK() OVER (
        PARTITION BY "Category"
        ORDER BY SUM("Sales") DESC
    ) AS sales_rank
FROM orders
GROUP BY "Category", "Product Name";
