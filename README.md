# 🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

![Zepto Banner](zepto-banner.png)


This is a complete, realistic **data analyst portfolio project** based on an **e-commerce inventory dataset** inspired by [Zepto](https://www.zeptonow.com/) — India’s fastest-growing quick-commerce platform.

This beginner-friendly SQL project simulates a real-world scenario where a junior analyst explores messy catalog data, cleans it, and derives insights to help the business make smarter pricing, inventory, and vendor decisions.

---

## 🛠 Tech Stack

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



This section outlines the complete step-by-step workflow for building the **Zepto E-commerce SQL Data Analyst Portfolio Project**, using real-world catalog data in PostgreSQL and analyzing it through SQL queries in VS Code.

Each step simulates what a junior analyst would do in a real e-commerce company to extract business insights from raw product data.

---

### 🧩 1. Environment Setup

- Install **PostgreSQL** as the SQL engine for querying and storage.
- Use **VS Code** as the main development environment.
- Install the **PostgreSQL extension** in VS Code to connect and run queries directly inside the editor.
- Optional: Use **pgAdmin** for GUI-based management.

---

### 📁 2. Create a New Project Directory

- Create a folder named `zepto-sql-project` to store all project files.
- Inside this folder, include:
  - The original CSV dataset
  - SQL scripts for table schema, data cleaning, and insights
  - A `README.md` for documentation
  - An `assets/` folder for images or banner logos (optional)

---

### 🛠️ 3. PostgreSQL Database & Table Setup

- Create a new database (e.g., `zepto_project_db`) in PostgreSQL.
- Define the structure of the `products` table based on the dataset columns.
- Use appropriate data types and add a primary key.

---

### 📥 4. Import the Dataset into PostgreSQL

- Import the `.csv` file using:  Link:-https://www.kaggle.com/datasets/merlinscat/zepto-products-dataset
  - The `\copy` command in PostgreSQL CLI or
  - The "Import" feature in pgAdmin
- Ensure UTF-8 encoding is selected to avoid character issues.
- Confirm the data loads correctly with the correct number of rows.

---

### 🧹 5. Data Cleaning

- Clean price columns by removing currency symbols (`₹`) and converting them to numeric.
- Extract numeric values from textual discount fields like `'15% Off'`.
- Identify and handle null or zero values in key columns like MRP and offer price.
- Extract embedded fields such as `Brand` or `Country of Origin` from `product_highlights` and `product_information` columns using text parsing (e.g., regex).

---

### 🔍 6. Exploratory Data Analysis (EDA)

- Count the total number of records and identify nulls or inconsistencies.
- Analyze unique categories and subcategories in the catalog.
- Review stock availability (e.g., in-stock vs out-of-stock).
- Identify duplicate product entries due to SKU variants.
- Examine the spread of product weights, prices, and discounts.

---

### 📊 7. Business-Focused SQL Analysis

Answer realistic, e-commerce-driven questions using SQL:

- Which product categories have the most listings?
- Which products offer the highest discounts?
- Are there any pricing inconsistencies (e.g., offer price > MRP)?
- What are the top brands per category?
- Which products have no discount?
- What’s the average discount per category?
- What is the total inventory weight per category?
- What is the potential revenue if all stock sells at discounted price?

Each query is designed to mimic real requests from a marketing, category, or operations team.

---

### 📦 8. Generate Key Insights

From the analysis above, summarize and document business insights such as:

- ✅ Products with invalid or missing pricing
- ✅ Categories offering the best customer value
- ✅ Inventory-heavy categories
- ✅ Top-performing brands in each category
- ✅ Discount effectiveness

These insights can be used for internal reporting, strategy, and team decision-making.

---

### 🧾 9. Document the Project

- Write a detailed `README.md` (this file!) to explain:
  - The goal of the project
  - The business context
  - The tools used
  - The process and findings
- Include screenshots or sample outputs if possible.
- Add a banner image (optional) using a public or local path.

---

### 🚀 10. Publish to GitHub

- Upload all project files to a GitHub repository:
  - CSV dataset (or a link to the source)
  - SQL files (`schema.sql`, `cleaning.sql`, `analysis.sql`)
  - Final `README.md`
- Make it public and showcase it as a portfolio-ready project on LinkedIn or during interviews.

---

📌 This end-to-end workflow is designed to help beginner data analysts simulate real industry tasks using only SQL and open-source tools — ideal for job preparation, interview discussion, or resume/LinkedIn portfolio work.

