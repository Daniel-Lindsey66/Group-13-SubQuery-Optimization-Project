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

### Query 1

Returns the delay between create_date/issue_date along with the average delay of create_date/issue_date for complaints in the same city

### Query 2

return cities where the total number of complaints exceeds the number of complaints that were submitted via Internet. This will return all cities

### Query 3

Return each complaint record along with the creation date of the most recent complaint in the same zip code

### Query 4
return a complaint record along with the a count of complaints in the same zip code

### Query 5
Find complaints that share a caller_id with atleast 1 other complaint
