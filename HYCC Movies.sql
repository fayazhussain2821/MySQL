select * from movies;
# MOVIES TABLE
# HAVING
# 1) Find the number of movies released each year, but only show years where more than 2 movies were released.
select release_year, count(*) as movies_count
from movies
group by release_year
having movies_count>2
order by movies_count desc;
 
# 2) Show the average IMDb rating for each industry, but only include industries with an average rating greater than 8.
select industry, round(avg(imdb_rating),2) as avg_rating
from movies
group by industry 
having avg_rating>8
order by avg_rating desc

# 3) Count the number of movies per studio, but only include studios with at least 2 movies.
select studio, count(*) as no_of_movies
from movies 
group by studio
having no_of_movies>=2
order by no_of_movies desc; 


# 4) Find the release years where the highest IMDb rating is greater than 9.
select release_year, max(imdb_rating)as high_rating
from movies 
group by release_year
having high_rating>9
order by high_rating desc;


# 5) Find industries having more than 10 movies.
select industry, count(industry) as cnt
from movies
group by industry
having cnt>10
order by cnt desc; 


# CALCULATED COLUMNS
# 6) Display movie title and IMDb rating, and add a new column Rating_x10 which is IMDb rating multiplied by 10.
select title, imdb_rating,(imdb_rating*10) as Rating_x10 from movies;

# 7) Show title, release_year, and a calculated column Age_of_Movie = (2025 - release_year).
select title,release_year,(2025-release_year)as Age_of_Movie from movies;

# 8) Find the average IMDb rating of movies, rounded to 2 decimals, and display it as Avg_Rating.
select round(avg(imdb_rating),2) as Avg_rating from movies;

# 9) Show all movies with IMDb rating and a calculated column Rating_Category that says "High" if rating ≥ 8, otherwise "Low".
select title,
if (imdb_rating>8,"High","Low") as Rating_Category
from movies;

# 10) Find the difference between the highest and lowest IMDb ratings in the dataset (name it Rating_Range).
select (max(imdb_rating)-min(imdb_rating)) as Rating_range from movies;