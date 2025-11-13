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

