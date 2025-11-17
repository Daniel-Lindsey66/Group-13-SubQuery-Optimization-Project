## Query Analysis

## Crime Dataset

### Query 1

Query 1 retrives records where the victim's age is greater than the average victim age of the entire dataset

#### Correlated

  > SELECT c1.*
  > FROM crimedata_10 c1
  > WHERE c1.vict_age > (
  >     SELECT AVG(c2.vict_age)
  >     FROM crimedata_10 c2
  >     WHERE c2.area = c1.area
  > );

#### Decorrelated

### Query 2

Query 2 locate crime records in areas where a "Theft of Identity" crime has already occurred

### Query 3

Query 3 returns areas where more than 100 crimes have occurred

### Query 4

Query 4 return crime records which are the most recent in their area

### Query 5

Query 5 return crime records in areas where "UNAUTHORIZED COMPUTER ACCESS' crime hasn't occured

## Complaint Dataset
