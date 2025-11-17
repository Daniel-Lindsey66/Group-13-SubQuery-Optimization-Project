# Database Theory (CS5151) - Group 13: PostgreSQL Decorrelation Project

## Project Type: Fix and Win

## Overview
<div align='justify'>
PostgreSQL features a cost-based query optimizer that transforms SQL queries into more efficient permutations to minimize execution time. This optimizer utilizes a variety of efficiency improving techniques such as index utilization, query flattening, and sub-query unnesting/decorrelation among others. 
<br/><br/>
Sub-queries can come in multiple forms - nested and nested with correlation:

 - A **nested query** is simply any query that is placed inside another, often to divide the main query into multiple steps such as for filtering or aggregation operations. The inner query(ies) will always run first with the outer most query running last. Each execution of an  inner query will be independent of that of the outer query.
   
       > SELECT doctor_id, doctor_name, patient_count    
       > FROM doctors  
       > WHERE patient_count > (    
       >   SELECT AVG(patient_count)    
       >   FROM doctors  
       >   WHERE specialization = doctors.specialization  
       > );  

      Result: (5, Ross, 57)
   

- A **nested query with correlation** is a sub-query that references the outer query during execution. Since the sub-query references columns from the outer query this can make correlated queries less efficient than non-correlated sub-queries.

      > SELECT doctor_id, doctor_name, patient_count  
      > FROM doctors d1  
      > WHERE patient_count = (  
      >    SELECT MAX(patient_count)  
      >    FROM doctors d2  
      >    WHERE d1.specialization = d2.specialization  
      > );

     Result: (1, David, 20), (2, Shane, 10), (5, Ross, 57)
<br/><br/>
<div align='justify'>
It is then possible to unnest and decorrelate these queries for improved execution times. This only holds if the sub-query is within a WHERE or HAVING clause. Any sub-query within a FROM clause is instead clasified as a view and falls outside the scope of this project.  
 
- An **unnested query** ...
- An **decorrelated query** ...

<br/><br/>
This project covers the topic of SQL sub-query unnesting and decorrelation, providing real-world based evidence on the efficiency improvements provided on average when a query has been fully unnested and/or decorrelated.  
We have also identified 3(?) edge cases which are unable to be unnested consistently using current methodology and provided examples and reasoning on why they can't be unnested.
</div>


## Problem(s) Addressed

Little real-world evidence is available detailing the efficiency improvements that unnesting/decorrelation provides - specifically in terms of specific SQL operators and levels of nesting.

Current unnesting algorithms only address specific permutations. While the current rules are mostly comprehensive, there still exist edge cases that are not supported.



## Basis
<div align='justify'>
This project is based on enhancing the results of Thomas Neumann's 'Improving Unnesting of Complex Queries' (2024) and it's precursor 'A Formalization of Top-Down Unnesting' (2024).
</div>

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

## Results
<div align='justify'>
**General summary of results go here along with graphs and list of edge cases**
**Link to more in-depth results page**
</div>


## Group Contact Information

| Member Name | Role | Email Address |
|:-----------:|:----:|:-------------:|
| Daniel Lindsey | Team Leader | lindsede@mail.uc.edu |
| Chase Keller | Holder | kellec8@mail.uc.edu |
| Long Nguyen | Holder | nguye2l6@mail.uc.edu |



## Bibliographies and Related Works
<div align='justify'>
 
1. **Improving Unnesting of Complex Queries**  
  > Basis Work - by: Thomas Neumann    
  >
  > Bibliography summary here.  
  > [Article Link](https://15799.courses.cs.cmu.edu/spring2025/papers/11-unnesting/neumann-btw2025.pdf)

2. **A Formalization of Top-Down Unnesting**
  > Basis Work - by: Thomas Neumann
  >
  > Bibliography summary here.  
  > [Article Link](https://arxiv.org/pdf/2412.04294)

3. **SQL Correlated Subqueries**
  > Informative Work - by: Geeks For Geeks, Mrinal Verma
  >
  > Bibliography summary here.  
  > [Article Link](https://www.geeksforgeeks.org/sql/sql-correlated-subqueries/)
 
4. **Nested Queries in SQL**
  > Related Work - by: Geeks For Geeks, Kartik
  >
  > Bibliography summary here.  
  > [Article Link](https://www.geeksforgeeks.org/sql/nested-queries-in-sql/)

5. **SQL Subqueries and Correlated Queries: Mastering Nested Queries for Expert Developers**
  > Informative Work - by: Software Patterns Lexicon, Faud Efendi
  >
  > Bibliography summary here.  
  > [Article Link](https://softwarepatternslexicon.com/patterns-sql/3/7/)

6. **RW1 Holder**
  > Related Work - by:
  >
  > Bibliography summary here.\
  > [Article Link]()

</div>
