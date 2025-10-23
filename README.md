#  Hospital Data Analysis

##  Overview

This project analyzes hospital data to uncover insights on patient encounters, procedure costs, insurance coverage, and behavior patterns. The analysis supports the hospital’s annual reporting and strategic planning efforts.


##  Objectives
- Encounters Overview: Analyze the trends in each encounter such as volume, what the visit is for, and the length of each visit
- Cost and Coverage Insights: Analyze insurance coverages, costs of specific procedures and claims.
- Patient behavior analysis: Analyze patterns in patient behavior such as length of stay and readmissions

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

##  Exploratory Data Analysis (EDA)
When exploring the Encounters table we sought to answer 3 questions. Here I will list the questions and give my insights as to the results of each question.

1. How many encounters occurred each year?
   - I noticed that every year had around the same number of encounters with the exception of three years. For reference, most of the years had around 2100 to 2500 encounters. However, 2011 only had 1336, 2014 had 3887, and 2021 had 3531. It would be hard for me to infer why 2011 and 2014 are outliers but based on this data I would assume that 2021 had a lot of encounters that were somehow related to Covid. 

2. For each year, what percentage of encounters belonged to each encounter class?
   - The data shows that, during every year, most of the patients were ambulatory with each year having around 40%-50% of the encounters being listed in this classification. Something else to note for the next question is that very few of the encounters were actually classified as inpatient with the numbers being around 1%-6%.

3. What percentage of encounters lasted more than 24 hours?
   - 4.1% of the total encounters lasted more than 24 hours which lines up with my gatherings from the previous question.

Then when I analyzed the payer coverage I sought to answer the following:

1. How many encounters had 0 payer coverage?
    - The result of this was that 48.7% of encounters had zero payer coverage. This means that almost half of the encounters were paid out of pocket by the patients. 

2. What are the top 10 most frequent procedures and the average base cost for each?
    - The most frequent procedures were some sort of assments or screenings which makes sense as those things are regular occurences. 8 out of the 10 also had the same average base cost of $431.00 which I assume is just the base cost for a general doctor visit at this hospital then. 
3. What are the top 10 procedures by average base cost and what is their frequency?
    - Here we looked at the most expensive procedures and how much they occurred. This question seems very similar to the previous one but there is definitely a lot of contrast between their results. The most expensive procedure is an admittance to the ICU which costs over $200,000 and this hospital has had 5 encounters with this procedure. To put it into perspective, these 5 instances combined costed a little more than half the combined number of the most frequent procedure which is a general health assessment at 4596 encounters. The ICU visits costed a total of approximately $1 million while the general health assment costs approximately $1.9 millionn

Finally, while I was going over patient behavior I wanted to answer the following:

1. How many unique patients were admitted each quarter?
    - Across the dataset most of the quarters were very stable when it came to the number of unique patients with most of them being in the 200-300 range. However, 2021 had a few quarters in the 400-500 range which makes sense given that this year had a more than normal amount of encounters like stated before. 

2. How many patients were readmitted within 30 days of a previous encounter
    - The result of this was 854 patients. This number seems high but I think we can infer that a lot of these high frequency patients come back due to long term treatment plans that require them to.
  
3. Which patients had the most readmissions?
    - Here we get the actual results of which patients kept coming back. From here it makes it easy to look up these high frequency patients and figure out why they keep coming back so often. 
