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
