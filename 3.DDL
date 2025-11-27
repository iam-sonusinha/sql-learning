NOTES (Concepts & What’s Covered)
🔹 Likely Topic: DISTINCT (Unique Values) in SQL SELECT
Based on surrounding videos in the playlist and the common teaching order, the video is likely about how to use the DISTINCT keyword in SQL to fetch unique values from a table. This is a standard SQL topic often taught after basics of SELECT, WHERE, etc. The keyword DISTINCT ensures duplicates in result-sets are removed. 

🔹 What DISTINCT Does
When a column (or combination of columns) might have duplicate entries across rows, DISTINCT lets you get only unique / different values. 
Without DISTINCT, a SELECT might return many repeated values — especially if the table logs multiple events per entity, or multiple entries share the same column values.
Use DISTINCT when you want to see “one-of-each” value. For example: a list of all different cities customers are from, or all distinct product categories in sales.

🔹 Syntax & Behavior
Basic syntax:
SELECT DISTINCT column1, column2, ...
FROM table_name;
``` :contentReference[oaicite:2]{index=2}

- If you specify only one column after `DISTINCT`, the result will show unique values of that column.  
- If you specify multiple columns — `DISTINCT` ensures uniqueness across the **combination** of those columns. Two rows are considered the same only if **all** the listed columns match.  

---

### 🔹 Combining `DISTINCT` with Aggregates or Other Clauses  
- You can use `DISTINCT` inside aggregate functions (depending on SQL dialect), e.g. `COUNT(DISTINCT column_name)` to count number of distinct values. :contentReference[oaicite:3]{index=3}  
- `DISTINCT` is applied before `ORDER BY` or other clauses that process the result — i.e. it filters duplicates early.  
- Use `DISTINCT` when you care about uniqueness; otherwise skip it to get full data (including duplicates).
---

### 🔹 When to Use (Why It’s Useful)  
Scenarios when `DISTINCT` helps:
- You have a table with many records and want to know **all possible values** of a column.  
- You want to remove redundant data when presenting summary lists (e.g. list of countries, cities, categories).  
- You're preparing filters or dropdown options in apps or reports — you need unique entries.  
- You want to count unique occurrences of something rather than total rows.  

But — avoid overusing: if table is large, removing duplicates can be resource-intensive; also if you only query a few columns but need full row data, `DISTINCT` may not help.
---
## 📝 PART 2 — EXAMPLES (SQL Queries Illustrating `DISTINCT` and Variants)
Assume we have a table `Customers`:
Customers
customer_id | name | city

1 | Alice | Mumbai
2 | Bob | Delhi
3 | Carol | Pune
4 | Dave | Mumbai
5 | Eve | Pune

### ✅ Example A — Distinct Single Column  
Get list of all distinct cities where customers live:
```sql
SELECT DISTINCT city
FROM Customers;

Result:
Mumbai
Delhi
Pune

Only unique city names; duplicates removed.

✅ Example B — Distinct with Multiple Columns
Suppose table has possible duplicates across combination of columns. Example:
Orders
----------------------------
order_id | customer_id | product  
----------------------------
1        | 1           | Pen      
2        | 1           | Pencil   
3        | 2           | Pen      
4        | 2           | Pen      
5        | 3           | Notebook 


If you want unique combinations of customer & product:
SELECT DISTINCT customer_id, product
FROM Orders;

Result:
customer_id | product
1           | Pen
1           | Pencil
2           | Pen
3           | Notebook


Even though there were two orders with (2, Pen), it's listed only once.
✅ Example C — Counting Unique Values
Count how many distinct cities customers are from:
SELECT COUNT(DISTINCT city) AS unique_city_count
FROM Customers;


Result: 3
✅ Example D — Use DISTINCT When Not Using All Columns
If you have a table Employees:
Employees
----------------------------
employee_id | name     | dept  
----------------------------
1           | Alice    | HR    
2           | Bob      | Sales 
3           | Carol    | Sales 
4           | Dave     | HR    
5           | Eve      | IT    


To get unique departments:
SELECT DISTINCT dept
FROM Employees;

Result:
HR
Sales
IT

✅ Example E — Distinct but with ORDER BY (Sorted Unique Results)
Get distinct cities sorted alphabetically:
SELECT DISTINCT city
FROM Customers
ORDER BY city ASC;

Result:
Delhi
Mumbai
Pune

✅ KEY TAKEAWAYS (for You to Remember)
Use DISTINCT when you want unique values — either single column or combination of columns.
SELECT DISTINCT cleans duplicates — good for summary lists, dropdown data, unique counts.
For counting unique values, combine DISTINCT with aggregate functions (like COUNT(...)).
Be careful: duplicates are defined across all columns you list after DISTINCT.

Avoid unnecessary DISTINCT if you need full data or duplicates matter — it can slow down queries.
