select * from movies;
# print all the years where more than 2 movies were released
# HAVING -- should be there in select 

# FROM --> WHERE --> GROUP BY --> HAVING --> ORDER BY
select release_year, count(*) as movies_count
from movies
group by release_year
having movies_count>2
order by movies_count desc;

select release_year, count(*) as movies_count
from movies
where imdb_rating>6
group by release_year
having movies_count>2
order by movies_count desc;

# Actors table
# YEAR
SELECT * FROM actors;
select curdate();
select year(curdate());
select *, year(curdate())-birth_year as age from actors;

# Financials table
SELECT * FROM financials;
select *, (revenue-budget) as profit from financials;
# USD to INR = 83

# IF 
# Syntax - if(condition,true, false)
select *,
if(currency="USD", revenue*83,revenue) as revenue_inr
from financials;

select distinct unit from financials; 

# billions to milions --> 12 billions --> 12000 million --> 12*1000
# thousands to millions  --> 45000 --> 4.5 million --> 45/1000

## CASE 
select *,
case 
	when unit='billions' then revenue*1000
    when unit='thousands' then revenue*1000
    when unit='millions' then revenue
end as revenue_millions 
from financials;


select *,
case 
	when unit='billions' then revenue*1000
    when unit='thousands' then revenue*1000
    else revenue
end as revenue_millions 
from financials;