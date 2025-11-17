# Database Theory (CS5151) - Group 13: PostgreSQL Decorrelation Project

## Project Type: Fix and Win



## Overview

PostgreSQL features a cost-based query optimizer that transforms SQL queries into more efficient 
permutations to minimize execution time. This optimizer utilizes a variety of efficiency improving techniques 
such as index utilization, query flattening, and query unnesting/decorrelation among others. 
This project covers the topic of SQL query unnesting, and provides real-world based
evidence on the efficiency improvements unnesting provides on average in comparison to their nested 
counterparts.  We also hope to identify edge cases which are impossible to unnest using current methods 
and attempt to provide a methodology on how to unnest such queries. 

We have also identified 3(?) edge cases which are unable to be unnested consistently using current methodology and provided examples and reasoning on why they can't be unnested.



## Problem(s) Addressed

Little real-world evidence is available detailing the efficiency improvements that unnesting/decorrelation provides - specifically in terms of specific SQL operators and levels of nesting.

Current unnesting algorithms only address specific permutations. While the current rules are mostly comprehensive, there still exist edge cases that are not supported.



## Basis

This project is based on enhancing the results of Thomas Neumann's 'Improving Unnesting of Complex Queries' (2024) and it's precursor 'A Formalization of Top-Down Unnesting' (2024).


## Datasets
The datasets used for our evaluations were obtained from Data.gov, an official United States repository allowing for public access to data used by the federal government. All information contained within the datasets are verified for accuracy and routinely maintained by the federal government under the OPEN Government Data Act. For more detailed information please see the Data.gov [user guide.](https://data.gov/user-guide/)

Below is a brief overview of the datasets we used during testing, their sources, and our rationale for their inclusion. To view the raw data please download the compressed CSV files found [here](/DataSets.7z). If you would like to test out our evaluation quieries yourself, please download the [SQL Schema](/table_schema_datasets.sql) and run the queries below. Please note that you will need to modify the 'UserName' variable in the SQL Schema to match your PC Username so that it will be able to properly evaluate the file path. Instructions are also provided if you run into a permissions error.

1. Crime Data
> The first dataset we used was Los Angeles, California crime data dating back from 2020 to current day. With roughly over a million datapoints and 28 columns worth of information for each point; this dataset offered a good starting point for evaluating query-runtime.
>
>  [Source](https://catalog.data.gov/dataset/crime-data-from-2020-to-present)  
>  [Evaluation Queries]()  
>

2. Consumer Complaints
   
> Our second dataset we used contained Consumer Complaint data going back to October 31st of 2014. This dataset has over 3 million datapoints and served as an upper bound for our testing.
>
>  [Source](https://catalog.data.gov/dataset/cgb-consumer-complaints-data)  
>  [Evaluation Queries]()  


3. Climate Data (Rejected)

> Originally we wanted to also work with national weather data that was collected across roughly 5,500 weather observation stations. The data was monitored and maintained by the National Centers for Environmental Information (NCEI); containing over a million datasets from 6-month sets spanning 2020-2025. Multiple sets were pulled using the National Oceanic and Atmospheric Administration's (NOAA) Climate Data Online Search for Daily Summaries.
> 
> The main issue we ran into with this dataset was that it hadn't been normalized and contained too many inconsitencies to continue using. It also made the schema overly complex with having to import multiple datasets into a single table - which made the removal and overall net positive for our project.
>
> [Source](https://catalog.data.gov/dataset/u-s-hourly-precipitation-data2)  

## Results

**General summary of results go here along with graphs and list of edge cases**
**Link to more in-depth results page**



## Group Contact Information

| Member Name | Role | Email Address |
|:-----------:|:----:|:-------------:|
| Daniel Lindsey | Team Leader | lindsede@mail.uc.edu |
| Chase Keller | Holder | kellec8@mail.uc.edu |
| Long Nguyen | Holder | nguye2l6@mail.uc.edu |



## Bibliographies and Related Works
1. **Improving Unnesting of Complex Queries**
  > Basis Work - by: Thomas Neumann
  >
  > Bibliography summary here.\
  > [Article Link](https://15799.courses.cs.cmu.edu/spring2025/papers/11-unnesting/neumann-btw2025.pdf)

2. **A Formalization of Top-Down Unnesting**
  > Basis Work - by: Thomas Neumann
  >
  > Bibliography summary here.\
  > [Article Link](https://arxiv.org/pdf/2412.04294)

3. **RW1 Holder**
  > Related Work - by: 
  >
  > Bibliography summary here.\
  > [Article Link]()

4. **RW2 Holder**
  > Related Work - by:
  >
  > Bibliography summary here.\
  > [Article Link]()

