# 📈 Customer Retention & Sales Performance Analysis (Advanced SQL Project)

This project explores customer behavior and profitability using advanced SQL techniques such as window functions, CTEs, subqueries, and rank-based filtering. It provides deep insights into retention trends, cumulative profits, and high-value customers.

---

## 🗂 Dataset

- **Source**: Superstore Dataset
- **Tool Used**: MySQL Workbench
- **File**: `superstore_data`

---

## 🔍 Business Questions Answered

1. How often do customers place repeat orders?
2. What are the most profitable months in each region?
3. Which product categories yield the highest profit margins?
4. How does profit accumulate over time?
5. Who are the top 10 most profitable customers?

---

## 💡 Key Insights

- Some customers order frequently with very short gaps, indicating high loyalty.
- Certain regions show clear peak months for profit generation.
- Negative monthly profits highlight discount or return issues.
- 10 customers generate a significant share of total profit.

---

## 💻 SQL Concepts Used

- `LAG()`, `RANK()`, `ROW_NUMBER()`
- `DATEDIFF()`, `STR_TO_DATE()`, `DATE_FORMAT()`
- `CTEs`, subqueries, `PARTITION BY`
- Running totals and customer segmentation

---

## 📁 Files Included

- `customer_retention_analysis.sql` – All advanced SQL queries
- `customer_retention_README.md` – Project documentation

---

## 🧠 Skills Demonstrated

- Advanced SQL for customer and sales analytics
- Data transformation, trend analysis, and ranking
- Clean, business-ready insights for real-world decisions
