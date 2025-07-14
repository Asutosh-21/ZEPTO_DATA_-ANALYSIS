ZEPTO DATA ANALYSIS
--------------------


CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT,
    net_qty TEXT,
    offer_price TEXT,
    discount TEXT,
    mrp TEXT,
    category TEXT,
    image_urls TEXT,
    product_highlights TEXT,
    product_information TEXT,
    search_phrase TEXT
);


--count of rows
select count(*) from zepto;

--sample data
SELECT * FROM zepto
LIMIT 10;


--DATA CLEANING

-- Clean offer_price: remove ₹, convert to numeric
ALTER TABLE products ADD COLUMN offer_price_rs NUMERIC;

UPDATE products
SET offer_price_rs = REPLACE(offer_price, '₹', '')::NUMERIC;

-- Clean MRP
ALTER TABLE products ADD COLUMN mrp_rs NUMERIC;

UPDATE products
SET mrp_rs = REPLACE(mrp, '₹', '')::NUMERIC;

-- Clean discount
ALTER TABLE products ADD COLUMN discount_percent NUMERIC;

UPDATE products
SET discount_percent = REPLACE(REPLACE(discount, '% Off', ''), ' ', '')::NUMERIC;


-- Handle missing values (example for mrp)
SELECT COUNT(*) FROM products WHERE mrp IS NULL;




-- Count nulls in MRP
SELECT COUNT(*) AS missing_mrp FROM products WHERE mrp IS NULL OR mrp = '';

-- Count nulls in discount
SELECT COUNT(*) AS missing_discount FROM products WHERE discount IS NULL OR discount = '';

-- Show rows with price anomalies
SELECT name, mrp_rs, offer_price_rs
FROM products
WHERE offer_price_rs > mrp_rs OR offer_price_rs = mrp_rs;



--DATA ANALYSIS FOR BUISNESS INSIGHTS 

--Q1. What are the top-performing product categories based on volume?
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC
LIMIT 5;



-- Q2. Which products offer the highest discounts?
SELECT name, discount_percent, offer_price_rs, mrp_rs
FROM products
WHERE discount_percent IS NOT NULL
ORDER BY discount_percent DESC
LIMIT 10;



-- Q3. Which premium products (MRP > ₹500) have less than 10% discount?
SELECT name, category, mrp_rs, discount_percent
FROM products
WHERE mrp_rs > 500 AND discount_percent < 10
ORDER BY mrp_rs DESC;



--Q4. Find and flag pricing errors (Offer Price > MRP)?
SELECT name, mrp_rs, offer_price_rs
FROM products
WHERE offer_price_rs > mrp_rs;



--Q5. What is the average discount offered per category?
SELECT category, ROUND(AVG(discount_percent), 2) AS avg_discount
FROM products
WHERE discount_percent IS NOT NULL
GROUP BY category
ORDER BY avg_discount DESC;



--Q6. How many products are missing pricing data (MRP or Offer Price)?
SELECT 
    COUNT(*) FILTER (WHERE mrp_rs IS NULL) AS missing_mrp,
    COUNT(*) FILTER (WHERE offer_price_rs IS NULL) AS missing_offer_price
FROM products;



-- Q7. What are the top brands in each category?
SELECT 
    category,
    product_highlights->>'Brand' AS brand,
    COUNT(*) AS brand_count
FROM products
WHERE product_highlights ? 'Brand'
GROUP BY category, brand
ORDER BY category, brand_count DESC;



--Q8. List products by Country of Origin

SELECT 
    name, 
    product_information->>'Country Of Origin' AS country
FROM products
WHERE product_information ? 'Country Of Origin'
ORDER BY country;

--Q9. What are the most common search phrases used?
SELECT 
    search_phrase,
    COUNT(*) AS search_count
FROM products
WHERE search_phrase IS NOT NULL AND search_phrase != ''
GROUP BY search_phrase
ORDER BY search_count DESC
LIMIT 10;

