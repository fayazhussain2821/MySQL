## SELECT

# 1) Write a query to display all columns from the movies table.
select * from movies;

# 2) Write a query to show only the movie title and release year.
select title, release_year from movies;

## WHERE

# 1) Find all movies released after the year 2010.
select * from movies where release_year>2010;

# 2) Find all movies from the Bollywood industry.
select * from movies where industry='bollywood';

# 3) Find movies with an IMDb rating greater than 8.5.
select * from movies where imdb_rating>8.5;

# 4) Find movies released before the year 2000.
select * from movies where release_year<2000;

## LIKE

# 1) Find all movies whose title starts with "The".
select * from movies where title like "The%";

# 2) Find movies whose title contains the word "Avengers".
select * from movies where title like '%avengers%';

# 3) Find movies whose title ends with the word "War".
select * from movies where title like '%war';

# 4) Find movies with the word "King" anywhere in the title.
select * from movies where title like '%king%';

## DISTINCT

# 1) Show all distinct industries available in the movies table.
select distinct industry from movies;

# 2) Show all distinct release years in ascending order.
select distinct release_year from movies order by release_year asc; 

# 3) Show distinct studios from the table.
select distinct studio from movies;

## ORDER BY 
 
# 1) List all movies ordered by release year (oldest first).
select * from movies order by release_year;

# 2) List all movies ordered by IMDb rating (highest first).
select * from movies order by imdb_rating desc;

# 3) List all Bollywood movies ordered by title alphabetically.
select title, industry from movies where industry='bollywood' order by title asc;

## LIMIT & OFFSET 
 
 # 1) Display the first 5 movies from the table.
 select * from movies limit 5;
 
 # 2) Display the next 5 movies after skipping the first 5.
 # first 10 movies in the table
 select * from movies limit 10;
 select * from movies limit 5 offset 5;
 
 # 3) Find the top 3 highest-rated Hollywood movies.
 select * from movies where industry='hollywood' order by imdb_rating desc limit 3;
 
 # 4) Find the latest 2 Bollywood movies released.
 select * from movies where industry='bollywood' order by release_year desc limit 2;