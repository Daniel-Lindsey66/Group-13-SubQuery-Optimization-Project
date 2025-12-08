# Database Theory (CS5151) - Group 13: <br/>PostgreSQL Sub-Query Optimization Project

## Project Type: Fix and Win

## Problem(s) Addressed
<div align='justify'>
 
- Little real-world evidence is available detailing the efficiency improvements that unnesting/decorrelation provides - specifically in terms of specific SQL operators and levels of nesting.

- Current unnesting algorithms only address specific permutations. While the current rules are mostly comprehensive, there still exist edge cases that are not supported.
</div>

## Overview
<div align='justify'>
PostgreSQL features a cost-based query optimizer that transforms SQL queries into more efficient permutations to minimize execution time. This optimizer utilizes a variety of efficiency improving techniques such as index utilization, query flattening, and sub-query unnesting/decorrelation among others. 
<br/><br/>
Sub-queries can come in multiple forms - nested and nested with correlation:

 - A **nested query** is simply any query that is placed inside another, often to divide the main query into multiple steps such as for filtering or aggregation operations. The inner query(ies) will always run first with the outer most query running last. Each execution of an  inner query will be independent of that of the outer query.
   
       > SELECT *
       > FROM doctors
       > WHERE age > (
       >	  SELECT AVG(age)
       >   FROM doctors
       > );

      Result: (3, Elizabeth, 32), (5, Ross, 57)
   

- A **nested query with correlation** is a sub-query that references the outer query during execution. Since the sub-query references columns from the outer query this can make correlated queries less efficient than non-correlated sub-queries as the inner query must be re-run for each row
  
       > SELECT doctor_id, doctor_name, patient_count    
       > FROM doctors  
       > WHERE patient_count > (    
       >   SELECT AVG(patient_count)    
       >   FROM doctors  
       >   WHERE specialization = doctors.specialization  
       > );  

     Result: (3, Elizabeth, 32), (5, Ross, 57)

 - It is also possible for a sub-query to have both types of nesting as well as multiple nesting levels, both of which can heavily impact execution times.
   
       > SELECT doctor_id, doctor_name, patient_count  
       > FROM doctors d1
       > WHERE patient_count > (  
       >	  SELECT AVG(patient_count)  
       >   FROM doctors d2
       >   WHERE d1.specialization = d2.specialization 
       >   AND d2.age IN (
       >     SELECT age
       >     FROM doctors d3
       >     WHERE age >= 30 and age <= 50
       >   )
       );  

     Result: (5, Ross, 57)
<br/><br/>
<div align='justify'>
It is then possible to unnest and decorrelate these queries for improved execution times.  This can be done through a series of JOIN, GROUP BY, and WHERE clauses. Instead of replacing the subquery using a JOIN, CTEs will also work.  

 
- **Unnested query from above:**

      > SELECT *
      > FROM doctors d
      > JOIN (
      >   SELECT AVG(age) as avg_age
      >   FROM doctors
      > ) agg
      > ON d.age > agg.avg_age;
  
- **Decorrelated query from above:**

      > SELECT doctor_id, doctor_name, patient_count  
      > FROM doctors d
      > JOIN (
      >   SELECT specialization, AVG(patient_count) AS avg_patient_count
      >   FROM doctors
      >   GROUP BY specialization
      > ) AS specialization s
      > ON d.specialization = s.specialization
      > WHERE d.patient_count > s.avg_patient_count;

- **Unnested/Decorrelated query from above:**

      > SELECT doctor_id, doctor_name, patient_count
      > FROM doctors d
      > JOIN (
      >   SELECT specialization, AVG(patient_count) as avg_patient_count
      >   FROM doctors 
      >   WHERE age >= 30 and age <= 50
      >   GROUP BY specialization
      > ) agg
      > ON d.specialization = agg.specialization
      > WHERE d.patient_count > avg_patient_count; 

**This project covers the topic of SQL sub-query unnesting and decorrelation in the scope of PostgreSQL, providing real-world based evidence on the efficiency improvements provided on average when a query has been fully unnested and/or decorrelated. We also explore a variety of standardard and advanced SQL operations; examining their relationship with sub-queries and whether that impacts their ability to be unnested or decorrelated.**


## Basis
<div align='justify'>
This project is based on enhancing the results of Thomas Neumann's 'Improving Unnesting of Complex Queries' (2024) and it's precursor 'A Formalization of Top-Down Unnesting' (2024).
</div>
<br/>
The above works provide an in-depth overview of a Top-Down Unnesting technique where queries are unnested/decorrelated starting from the outer-most query and working in. This is opposite to the traditional method of unnesting which is from the bottom up; whereas unnesting begins in the inner most sub-query and working out. This new method allows for unnesting of recursive queries which previously could not be unnestied via traditional means.

## Datasets
<div align='justify'>
The datasets used for our evaluations were obtained from Data.gov, an official United States repository allowing for public access to data used by the federal government. All information contained within the datasets are verified for accuracy and routinely maintained by the federal government under the OPEN Government Data Act. For more detailed information please see the following <a href="https://data.gov/user-guide">user guide.</a>
<br/><br/>
Below is a brief overview of the datasets we used during testing, their sources, and our rationale for their inclusion. To view the raw data please download the compressed CSV files found <a href="/executables/DataSets.7z">here</a> If you would like to test out our evaluation quieries yourself, please download the <a href="/executables/table_schema_datasets.sql">SQL Schema</a> and run the queries below. Please note that you will need to modify the 'UserName' variable in the SQL Schema to match your PC Username so that it will be able to properly evaluate the file path. Instructions are also provided if you run into a permissions error.  
<br/><br/>
1. Crime Data
 
> The first dataset we used was Los Angeles, California crime data dating back from 2020 to current day. With roughly over a million datapoints and 28 columns worth of information for each point; this dataset offered a good starting point for evaluating query-runtime.
> 
>  [Source](https://catalog.data.gov/dataset/crime-data-from-2020-to-present)  
>  [Evaluation Queries](executables/queries/crimedata)  

2. Consumer Complaints
   
> Our second dataset we used contained Consumer Complaint data going back to October 31st of 2014. This dataset has over 3 million datapoints and served as an upper bound for our testing.
>
>  [Source](https://catalog.data.gov/dataset/cgb-consumer-complaints-data)  
>  [Evaluation Queries](executables/queries/crimedata)  


3. Climate Data (Rejected)

> Originally we wanted to also work with national weather data that was collected across roughly 5,500 weather observation stations. The data was monitored and maintained by the National Centers for Environmental Information (NCEI); containing over a million datasets from 6-month sets spanning 2020-2025. Multiple sets were pulled using the National Oceanic and Atmospheric Administration's (NOAA) Climate Data Online Search for Daily Summaries.
> 
> The main issue we ran into with this dataset was that it hadn't been normalized and contained too many inconsitencies to continue using. It also made the schema overly complex with having to import multiple datasets into a single table - which made the removal and overall net positive for our project.
>
> [Source](https://catalog.data.gov/dataset/u-s-hourly-precipitation-data2)  
</div>


## Group Contact Information

| Member Name | Role | Email Address |
|:-----------:|:----:|:-------------:|
| Daniel Lindsey | Team Leader, Repository Management | lindsede@mail.uc.edu |
| Chase Keller | Fact Checker, Presentation | kellec8@mail.uc.edu |
| Long Nguyen | Query Analysis, Data Collection | nguye2l6@mail.uc.edu |



## Sources and Related Works
<div align='justify'>
 
1. **Improving Unnesting of Complex Queries**  
  > Basis Work - by: Thomas Neumann    
  >
  > [Article Link](https://15799.courses.cs.cmu.edu/spring2025/papers/11-unnesting/neumann-btw2025.pdf)

2. **A Formalization of Top-Down Unnesting**
  > Basis Work - by: Thomas Neumann
  >
  > [Article Link](https://arxiv.org/pdf/2412.04294)

3. **SQL Correlated Subqueries**
  > Informative Work - by: Geeks For Geeks, Mrinal Verma
  >
  > [Article Link](https://www.geeksforgeeks.org/sql/sql-correlated-subqueries/)
 
4. **Nested Queries in SQL**
  > Informative Work - by: Geeks For Geeks, Kartik
  >
  > [Article Link](https://www.geeksforgeeks.org/sql/nested-queries-in-sql/)

5. **SQL Subqueries and Correlated Queries: Mastering Nested Queries for Expert Developers**
  > Informative Work - by: Software Patterns Lexicon, Faud Efendi
  >
  > [Article Link](https://softwarepatternslexicon.com/patterns-sql/3/7/)

6. **Speeding up SQL subqueries via decoupling of non-correlated predicate**
  > Related Work - by: Dmitrii Radivonchik, Yakob Kuzin, Aanton Chizhov, Dmitriy Scheka, Mikail Firsov, Kirill Smirnov, and George Chernishev
  >
  > [Article Link](https://arxiv.org/pdf/2510.05907)

</div>
