#  Hospital Data Analysis

##  Overview
This project analyzes hospital encounter data to uncover insights into patient visit trends, procedure costs, insurance coverage patterns, and patient behavior.

The goal is to support healthcare administrators in improving:
- Operational efficiency
- Financial performance
- Patient care and readmission management

The analysis focuses on answering key questions around patient volume, cost distribution, insurance coverage gaps, and repeat patient behavior.

---

## Business Objectives

This analysis supports hospital leadership in:

- **Operational Planning:** Understanding patient volume trends and encounter types to optimize staffing and resources  
- **Financial Analysis:** Identifying high-cost procedures and insurance coverage gaps affecting revenue  
- **Patient Management:** Analyzing readmission patterns and length of stay for care improvement opportunities  

---

 ##  Dataset Description
The dataset consists of **4 tables**: `Encounters`, `Procedures`, `Patients`, and `Payers`.

| Table | Key Fields | Description |
|--------|-------------|-------------|
| **Encounters** | ID, Start, Stop, Patient, Payer, Payer_Coverage, Total_Claim_Cost, EncounterClass | Records of each patient visit, including timing, payer, and cost details. |
| **Procedures** | Description, Base_Cost, Patient | Details of procedures performed and their associated costs. |
| **Patients** | Patient, Start, Stop | Basic patient information and encounter timelines. |
| **Payers** | Name | List of insurance providers. |


##  Tools & Technologies
| Category | Tools / Libraries |
|-----------|------------------|
| Language | SQL |
| Environment | SQL Server Management Studio |

---

## Key Insights

### 1. Encounter Trends & Visit Patterns
- Annual encounter volume remained stable (~2,100–2,500 per year), with notable outliers in 2011 (low), 2014, and 2021 (high).
- Ambulatory visits consistently accounted for **40–50% of all encounters**, making outpatient care the dominant service type.
- Only **4.1% of encounters lasted more than 24 hours**, indicating most care is short-term.

**Business Insight:**  
The hospital is primarily outpatient-driven, suggesting resource planning should prioritize ambulatory services.

---

### 2. Insurance Coverage & Cost Distribution
- **48.7% of encounters had zero payer coverage**, indicating a large uninsured or self-pay population.
- Most frequent procedures were routine assessments with an average base cost of **~$431**.
- High-cost procedures were rare but impactful:
  - ICU admissions exceeded **$200,000 per encounter**
  - Only 5 ICU cases accounted for approximately **$1M in total cost**

**Business Insight:**  
Hospital costs are heavily concentrated in a small number of high-acuity procedures, while nearly half of encounters generate no insurance coverage.

---

### 3. Patient Behavior & Readmissions
- Patient volume per quarter remained stable (200–300 range), with an increase in 2021 (400–500 range).
- **854 patients were readmitted within 30 days**, indicating a significant repeat-care population.
- A subset of patients showed frequent readmissions, suggesting chronic or long-term care needs.

**Business Insight:**  
Readmission patterns highlight opportunities to improve discharge planning and chronic care management.

---

## Skills Demonstrated
- SQL data exploration and aggregation  
- Multi-table joins and relational data modeling  
- Business-focused analytics and storytelling  
- Healthcare operations analysis  

---
