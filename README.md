# 🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

![Zepto Banner](https://assets.zepto.delivery/images/zepto-banner.png)

This is a complete, realistic **data analyst portfolio project** based on an **e-commerce inventory dataset** inspired by [Zepto](https://www.zeptonow.com/) — India’s fastest-growing quick-commerce platform.

This beginner-friendly SQL project simulates a real-world scenario where a junior analyst explores messy catalog data, cleans it, and derives insights to help the business make smarter pricing, inventory, and vendor decisions.

---

## 🎯 Who This Project Is For

- 📊 Aspiring data analysts who want to build a **job-ready portfolio**
- 🧠 SQL learners looking to solve **real-world e-commerce problems**
- 💼 Entry-level professionals preparing for interviews in **retail, product, or inventory analytics**

---

---

🛠 Tech Stack
🐘 PostgreSQL (pgAdmin or CLI)

💻 SQL (DDL, DML, aggregate functions, regex)

🧠 Real-world data cleaning & analysis logic

---

## 📌 Project Objectives

✅ Create a SQL database and import messy catalog data  
✅ Perform **data cleaning** (₹ symbols, missing values, invalid discounts)  
✅ Extract embedded fields (like Brand, Country) from text fields  
✅ Run **EDA and business-focused SQL queries**  
✅ Generate **8+ industry-grade insights** for a product team

---

## 📁 Dataset Overview

The dataset was scraped from **Zepto's product catalog** and mimics real e-commerce inventory systems. It includes multiple rows per product (due to different SKUs, weights, and packages).

🧾 **Columns** include:
- `product_id`: synthetic primary key  
- `name`: product name  
- `category`: like Dairy, Snacks, Fruits  
- `mrp`: messy price with ₹ symbol  
- `offer_price`: discounted price  
- `discount`: textual discount like `10% Off`  
- `product_highlights`: embedded info like `'Brand': 'Amul'`  
- `product_information`: embedded details like `'Country of Origin': 'India'`

---

## 🔧 Project Workflow

### 1. 🔨 Table Creation
```sql
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name TEXT,
    category TEXT,
    mrp TEXT,
    offer_price TEXT,
    discount TEXT,
    product_highlights TEXT,
    product_information TEXT
);
2. 📥 Data Import
Use pgAdmin → "Import/Export" tool
Or use SQL:

sql
Copy
Edit
\copy products(name, category, mrp, offer_price, discount, product_highlights, product_information)
FROM 'zepto_sales.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');
3. 🧼 Data Cleaning
✅ Converted mrp and offer_price from text (₹999) to NUMERIC

✅ Parsed discount from '10% Off' → 10.00

✅ Extracted brand from product_highlights using regex

✅ Extracted country_of_origin from product_information

sql
Copy
Edit
-- Example: Clean MRP
ALTER TABLE products ADD COLUMN mrp_rs NUMERIC;
UPDATE products SET mrp_rs = REPLACE(mrp, '₹', '')::NUMERIC WHERE mrp ~ '₹[0-9]';
4. 🔍 Exploratory Data Analysis (EDA)
Counted total products

Checked null values

Found unique categories

Analyzed availability & out-of-stock flags

Detected product duplicates by name

5. 📊 Business Analysis with SQL
8 Real Business Problems Solved:

#	Question	Insight
1️⃣	What are the top categories by product volume?	Optimize category focus
2️⃣	Which products have the highest discounts?	Best value offers
3️⃣	Are there any invalid prices?	Checked MRP < Offer
4️⃣	What’s the average discount per category?	Promo trends
5️⃣	Which brands dominate each category?	Vendor planning
6️⃣	What’s the country of origin for products?	Compliance
7️⃣	What products have no discount?	Pricing policy review
8️⃣	What is the total inventory weight by category?	Warehouse planning
