## Query Analysis

## Crime Dataset

### Query 1

>SELECT c1.*
>FROM crimedata_10 c1
>WHERE c1.vict_age > (
>    SELECT AVG(c2.vict_age)
>    FROM crimedata_10 c2
>    WHERE c2.area = c1.area
>);

#### Correlated

#### Decorrelated

### Query 2

### Query 3

### Query 4

### Query 5

## Complaint Dataset
