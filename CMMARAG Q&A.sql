select * from movies;
# COUNT

# 1) Write a query to count the total number of movies in the table.
select count(*) from movies;

# 2) Find how many Bollywood movies are in the dataset.
select count(*) from movies where industry='bollywood';

# 3)Count the number of movies released in the year 2022.
select count(*) from movies where release_year=2022;

# MIN / MAX

# 1) Find the oldest movie release year in the table.
select min(release_year) from movies;

# 2) Find the most recent movie release year.
select max(release_year) from movies;

# 3) Find the movie with the lowest IMDb rating.
select title, imdb_rating from movies 
where imdb_rating=(select min(imdb_rating) from movies);

# 4) Find the movie with the highest IMDb rating.
select title,imdb_rating from movies 
where imdb_rating=(select max(imdb_rating) from  movies);

# AVG

# 1) Find the average IMDb rating of all movies.
select avg(imdb_rating) from movies;

# 2) Find the average IMDb rating of Bollywood movies.
select avg(imdb_rating) from movies where industry='bollywood';

# 3) Find the average IMDb rating of Hollywood movies.
select avg(imdb_rating) from movies where industry='hollywood';

# AS (Aliases)

# 1) Write a query to display the movie title as Movie_Name and IMDb rating as Rating.'
select title as Movie_Name, imdb_rating as Rating from movies;

#2) Show industry and the count of movies in each industry, renaming the count column as Total_Movies.'
select industry, count(industry) as Total_Movies from movies group by industry;

# GROUP BY

# 1) Find the number of movies released in each year.
select release_year,count(release_year) as No_of_Movies_Per_Year 
from movies group by release_year 
order by release_year desc;

# 2) Find the number of movies in each industry.
select industry, count(title) as No_of_Movies 
from movies group by industry; 

# 3) Find the average IMDb rating of movies grouped by industry.
select industry, avg(imdb_rating) as avg_rating 
from movies group by industry; 

# ROUND

# 1) Find the average IMDb rating of all movies rounded to 2 decimal places.
select round(avg(imdb_rating),2) as avg_rating from movies;

# 2) Find the average IMDb rating of each industry rounded to 1 decimal place.
select industry, round(avg(imdb_rating),1) as avg_rating from movies group by industry;

# 3) Show the average IMDb rating per release year rounded to the nearest whole number.
select release_year, round(avg(imdb_rating),0) as avg_rating from movies group by release_year order by release_year;