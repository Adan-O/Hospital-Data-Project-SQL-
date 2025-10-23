Use [Hospital Project]


--Objective 1: Understanding Encounters table--

--Question 1: How many encounters occured each year?--

 SELECT 
    YEAR(Start) AS yr,
    COUNT(ID) AS Total_Encounters
FROM encounters
GROUP BY YEAR(Start)
order by yr

--Question 2: For each year, what percentage of all encounters belonged to each encounter class?--

SELECT 
    YEAR(Start) AS yr,
    Round(Sum(Case when Encounterclass = 'ambulatory' Then 1 Else 0 END) * 1.0 / count(*) * 100,1) as Ambulatory,
    Round(Sum(Case when Encounterclass = 'outpatient' Then 1 Else 0 END) * 1.0 /count(*) * 100,1) as Outpatient,
    Round(Sum(Case when Encounterclass = 'wellness' Then 1 Else 0 END) * 1.0 / count(*) * 100,1) as Wellness,
    Round(Sum(Case when Encounterclass = 'urgentcare' Then 1 Else 0 END) * 1.0 / count(*) *100,1) as Urgent_Care,
    Round(Sum(Case when Encounterclass = 'emergency' Then 1 Else 0 END) * 1.0 / count(*) *100,1) as Emergency,
    Round(Sum(Case when Encounterclass = 'inpatient' Then 1 Else 0 END) * 1.0 / count(*) *100,1) as Inpatient
From encounters
Group by Year(Start)
order by yr

--Question 3: What percentage of encounters were over 24 hours versus 24 hours?--

Select count(datediff(Hour, Start, Stop))
From encounters
Where datediff(Hour, Start, Stop) >= 24

Select count(datediff(Hour, Start, Stop))
From encounters
Where datediff(Hour, Start, Stop) < 24

Select Round(Sum(Case when datediff(Hour, Start, Stop) >= 24 Then 1 Else 0 End) *1.0 / count(*) *100,1) as over_24_hours,
       Round(Sum(Case when datediff(Hour, Start, Stop) < 24 Then 1 Else 0 End) *1.0 / count(*) *100,1) as under_24_hours,
       count(*)
       From encounters

--Objective 2: Analyze Payer coverage--

--Question 1: How many encounters had 0 payer coverage and what percentage of encounters does this represent?--

Select count(*)
From encounters
where payer_coverage = 0

Select count(*)
from encounters

Select Sum(case when payer_coverage = 0 then 1 else 0 end) as zero_payer_coverage,
       count(*) as Total_Encounters,
       Round(Sum(case when payer_coverage = 0 then 1 else 0 end) *1.0 / count(*) *100,1) as percent_zero_payer_coverage
From encounters

--Question 2: What are the top 10 most frequent procedures and the average base cost for each?--

Select top 10
Code, Description, count(*) as Num_Procedures, Avg(base_cost) as avg_base_cost
From procedures
Group by Code, Description
order by Num_Procedures desc

--- Question 3: What are the top 10 procedures with the highest average base cost and performance frequency--

Select top 10
Code, Description, Avg(base_cost) as avg_base_cost, count(*) as Num_Procedures 
From procedures
Group by Code, Description
order by avg_base_cost desc

-- Question 4: What is the average total claim cost for encounters, broken down by payer?--

SELECT 
    p.Name, 
    AVG(CAST(e.total_claim_cost AS DECIMAL(10, 2))) AS avg_total_claim_cost
FROM payers p
LEFT JOIN encounters e ON p.Id = e.payer
GROUP BY p.Name
Order by avg_total_claim_cost desc

--Objective 3: Patient Behavior Analysis--

--Question 1: How many unique patients were admitted each quarter?--

Select Year(Start) as yr, Datepart(Quarter, Start) as quarter, Count(Distinct Patient) as num_unique_patients
From encounters
Group by Year(Start), Datepart(Quarter, Start)
order by yr, quarter

--Question 2: How many patients were readmitted within 30 days of a previous encounter?--

Select Patient, Start, Stop,
Lead(Start) Over(Partition by Patient order by start) as next_start_date
From encounters
Order by Patient, Start

with cte as (Select Patient, Start, Stop,
Lead(Start) Over(Partition by Patient order by start) as next_start_date
From encounters)

Select count(distinct patient) as num_patients
From cte
where datediff(day, next_start_date, Stop) <30 

--Question 3: Which patients had the most readmissions?--

with cte as (Select Patient, Start, Stop,
Lead(Start) Over(Partition by Patient order by start) as next_start_date
From encounters)

Select Patient, Count(*) as num_readmissions
From cte
where datediff(day, next_start_date, Stop) <30 
Group by Patient
Order by num_readmissions desc

-- With this you can copy the patient from the previous query to figure out why a particular patient keeps coming in--
Select *
From Encounters
Where patient = '1712d26d-822d-1e3a-2267-0a9dba31d7c8'