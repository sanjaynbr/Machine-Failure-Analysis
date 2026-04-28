# 🚀 Machine Failure Analysis (Predictive Maintenance)

## 📌 Project Overview

This project focuses on analyzing machine failure patterns to enable **predictive maintenance** in a manufacturing environment. The goal is to identify key factors contributing to machine breakdowns and reduce unplanned downtime through data-driven insights.

The dataset consists of machine operational parameters such as **tool wear, torque, and machine type**, which are analyzed to understand their impact on failure rates.

The workflow includes:

* Data extraction and preprocessing using SQL
* Exploratory data analysis to identify trends and anomalies
* Building interactive dashboards in Power BI
* Identifying high-risk machines and failure thresholds

The analysis reveals that **tool wear is the most critical factor influencing failures**, with a sharp increase in failure probability beyond a certain threshold. Machines are categorized into **High, Medium, and Low risk clusters**, allowing targeted maintenance strategies.

This project demonstrates how data analytics can be applied to:

* Optimize maintenance scheduling
* Reduce operational costs
* Improve machine reliability

Overall, it provides a practical implementation of **predictive maintenance using data analytics and visualization tools**.


## 📊 Dashboard Highlights

### Failure Overview
![Overview](Main_Dashboard.jpg)

### Key Insights
![Overview](Insights.png)



---

## 📊 Key Metrics

* **Total Machines:** 10,000
* **Total Failures:** 339
* **Failure Rate:** 3.39%
* **Average Tool Wear:** 107.95
* **High-Risk Contribution:** 58.4%



---

## 🔍 Key Insights

* Preventive maintenance should be scheduled **before ~200 tool wear**
* **High-risk machines contribute 58.4%** of total failures
* Machine Type **L has the highest failure rate (3.92%)**
* Tool wear is the **strongest predictor of failure**

---

## 📈 Dashboard Features

* Failure rate by machine type
* Tool wear vs failure trend
* Risk clustering (**High / Medium / Low**)
* Interactive filters (Product ID, Machine Type)

---

## 🛠️ Tools & Technologies

* **SQL** – Data extraction
* **Power BI** – Data visualization
* **Data Analysis** – Predictive insights

## 🧮 Sample SQL Queries

### 📌 1. Average Air Temperature by Machine Type

```sql
SELECT 
    Type,
    Machine_failure,
    AVG(Air_temperature_K) AS Avg_Air_Temperature
FROM dbo.machine_data
GROUP BY Type, Machine_failure
ORDER BY Type;
```

### 📌 2. Effect of Tool Wear and Torque on Failure

```sql
SELECT  
    Machine_failure,
    AVG(Tool_wear_min) AS Avg_Tool_Wear,
    AVG(Torque_Nm) AS Avg_Torque
FROM machine_data
GROUP BY Machine_failure;
```

### 📌 3. Effect of RPM on Failure

```sql
SELECT 
    Machine_failure,
    AVG(Rotational_Speed_rpm) AS Avg_RPM
FROM machine_data
GROUP BY Machine_failure;
```

### 📌 4. Root Cause Analysis

```sql
SELECT 
    Machine_failure,
    AVG(Tool_wear_min) AS Tool_wear,
    AVG(Torque_Nm) AS Torque,
    AVG(Rotational_speed_rpm) AS RPM,
    AVG(Process_temperature_K - Air_temperature_K) AS Temp_diff
FROM dbo.machine_data
GROUP BY Machine_failure;
```

### 📌 5. Failure Rate by Machine Type

```sql
WITH Failure_Rate AS (
    SELECT 
        Type,
        COUNT(*) AS Total,
        SUM(machine_failure) AS Failures,
        ROUND(SUM(machine_failure)*100.0/COUNT(*), 2) AS Failure_rate
    FROM machine_data
    GROUP BY Type
)
SELECT * FROM Failure_Rate;
```

### 📌 6. Risk Level Classification

```sql
CREATE VIEW Risk_level_view AS
SELECT *,
   CASE
        WHEN Tool_wear_min > 130 OR Torque_Nm > 45 THEN 'High Risk'
        WHEN Tool_wear_min > 100 OR Torque_Nm > 40 THEN 'Medium Risk'
        ELSE 'Low Risk'
   END AS Risk_level
FROM machine_data;
```

```sql
SELECT 
    Type,
    COUNT(*) AS Total,
    ROUND(SUM(machine_failure)*100.0/COUNT(*),2) AS Failure_Rate,
    Risk_Level
FROM Risk_level_view
GROUP BY Type, Risk_Level
ORDER BY
    CASE 
        WHEN Risk_Level = 'High Risk' THEN 1
        WHEN Risk_Level = 'Medium Risk' THEN 2
        WHEN Risk_Level = 'Low Risk' THEN 3
    END,
    Failure_Rate DESC;
```

---

### 🧠 Purpose of These Queries

These queries were used to:

* Analyze key factors influencing machine failures
* Identify relationships between tool wear, torque, and RPM
* Calculate failure rates across machine types
* Classify machines into risk categories for predictive maintenance



---

## 📂 Project Structure

```
Machine-Failure-Analysis/
│
├── Machine_Data.sql
├── Machine_Failure_Analysis.pbix
├── Main_Dashboard.jpg
├── Insights.jpg
└── README.md
```

---

## 🎯 Business Impact

* Reduces unexpected machine downtime
* Enables data-driven maintenance scheduling
* Identifies high-risk machines proactively

---

## 📎 How to Use

1. Open `.pbix` file in Power BI Desktop
2. Load SQL dataset if required
3. Explore dashboard filters and insights

---
