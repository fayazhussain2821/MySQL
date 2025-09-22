select * from moviesdb.movies;
# By setting moviesdb as default we can directly query without calling database name everytime
select * from movies;

# Where
select * from movies where industry = "bollywood";
select * from movies where industry = "hollywood";
select * from movies where studio='';
select * from movies where imdb_rating>=9;
select * from movies where imdb_rating>9; 

# Like
select * from movies where title like "%thor%";
select * from movies where tile like '%america%';

# Distinct
select distinct industry from movies;



# And 
select * from movies where imdb_rating>=6 and imdb_rating<=8;
select * from movies where imdb_rating between 6 and 8;
select * from movies where release_year=2022;
select * from movies where release_year between 2011 and 2022;

# Or
select * from movies where release_year=2011 or release_year=2022;

# In
select * from movies where release_year in (2011,2019,2022);
select * from movies where studio in("Marvel Studios","Zee Studios");

# Null
select * from movies where imdb_rating is null;
select * from movies where imdb_rating is not null;

# Order By
select * from movies where industry="bollywood" order by imdb_rating;
select * from movies where industry='bollywood' order by imdb_rating desc;
select * from movies where industry='hollywood' order by release_year;

# Limit
select * from movies where industry='hollywood' order by release_year desc limit 5;
select * from movies where industry='bollywood' order by imdb_rating desc limit 10;


# Offset  -- indexing starts with 0
select * from movies where industry='hollywood' order by release_year desc limit 5 offset 1;
select * from movies where industry='hollywood' order by release_year desc limit 1 offset 1;
select * from movies order by imdb_rating desc;
select * from movies order by imdb_rating desc limit 1 offset 1;
