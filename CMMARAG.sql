# Summary Analytics (min, max, avg, group by)
select * from movies;

# COUNT
select count(*) from movies where industry='bollywood';

# MAX
select max(imdb_rating) from movies where industry='bollywood';
select max(release_year) from movies;
select max(imdb_rating) from movies where industry='hollywood';

# MIN
select min(imdb_rating) from movies where industry='bollywood';
select min(imdb_rating) from movies;
select min(release_year) from movies where industry='hollywood';

# AVG
select avg(imdb_rating) from movies;
select avg(imdb_rating) from movies where industry='hollywood';
select avg(imdb_rating) from movies where industry='bollywood';
select avg(imdb_rating) from movies where studio='marvel studios';

# ROUND
select round(avg(imdb_rating),2) from movies where studio='marvel studios';

# AS
select round(avg(imdb_rating),2) as avg_rating from movies where studio='marvel studios';
select min(imdb_rating) as min_rating, 
max(imdb_rating) as max_rating, 
round(avg(imdb_rating),2)as avg_rating 
from movies where studio='marvel studios';

# GROUP BY
select industry, count(*) from movies group by industry;
select studio, count(*) from movies group by studio;
select studio, count(*) as cnt from movies group by studio order by cnt desc;
select studio, count(studio) as cnt, 
round(avg(imdb_rating),2) as avg_rating 
from movies group by studio 
order by avg_rating desc;

select studio, count(studio) as cnt, 
round(avg(imdb_rating),2) as avg_rating 
from movies where studio!="" group by studio 
order by avg_rating desc;
