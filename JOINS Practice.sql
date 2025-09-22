select * from movies;
select * from financials;
select * from actors;
select * from movie_actor;

# INNER JOIN

# 1) Show all movies along with their budget and revenue.
select 
m.movie_id,budget,revenue
from movies m
join financials f
on m.movie_id=f.movie_id;

# 2)List movie titles with their corresponding currency from the financials table.
select
m.movie_id, title,currency
from movies m
join financials f
on m.movie_id=f.movie_id;

# 3) Show actors and the movies they acted in.
select 
a.name as actor_name,
m.title as movie_title
from actors a
join movie_actor ma on a.actor_id=ma.actor_id
join movies m on ma.movie_id=m.movie_id
order by a.name,m.title;

# LEFT JOIN

# 1) List all movies and their financials (show NULL if financial data is missing).
select
    m.movie_id,
    m.title,
    f.budget,
    f.revenue,
    f.currency,
    f.unit
from movies m
left join financials f 
on m.movie_id = f.movie_id
order by m.title;

# 2) Show all actors with the movies they acted in (even if some actors have no movie entry).
select 
a.name as actor_name,
m.title as movie_title
from actors a
left join movie_actor ma on a.actor_id=ma.actor_id
left join movies m on ma.movie_id=m.movie_id
order by a.name,m.title;

# 3) List all studios along with their movies, even if some movies don’t have financials.
select 
m.studio, m.title, f.budget, f.revenue
from movies m
left join financials f on m.movie_id = f.movie_id
order by m.studio, m.title;

# RIGHT JOIN

# 1) List all financials with movie titles (include financial records even if no movie title exists).
select f.movie_id, m.title, f.budget, f.revenue, f.currency, f.unit
from movies m
right join financials f on m.movie_id = f.movie_id
order by f.movie_id;

# 2) Show all movies that appear in the movie_actor table and their corresponding actor names.
select m.title, a.name as actor_name
from movie_actor ma
join movies m on ma.movie_id = m.movie_id
join actors a on ma.actor_id = a.actor_id
order by m.title, a.name;

# FULL OUTER JOIN (via UNION)

# 1) List all movies and their financials — even if data exists in only one table.
select m.movie_id, m.title, f.budget, f.revenue, f.currency, f.unit
from movies m
left join financials f on m.movie_id = f.movie_id

union

select f.movie_id, m.title, f.budget, f.revenue, f.currency, f.unit
from movies m
right join financials f on m.movie_id = f.movie_id;

# 2) List all actors and movies (whether or not the mapping exists in movie_actor).
select a.name as actor_name, m.title as movie_title
from actors a
left join movie_actor ma on a.actor_id = ma.actor_id
left join movies m on ma.movie_id = m.movie_id

union

select a.name as actor_name, m.title as movie_title
from actors a
right join movie_actor ma on a.actor_id = ma.actor_id
right join movies m on ma.movie_id = m.movie_id;

# USING Clause

# 1) Get movie details and their financials using USING(movie_id).
select movie_id, title, budget, revenue, currency, unit
from movies
join financials using (movie_id);

# 2) Show all movies released in 2022 with their budget using USING.
select movie_id, title, budget
from movies
join financials using (movie_id)
where release_year = 2022;
 
# MULTI-TABLE JOINS

# 1) List all actors along with the titles of the movies they acted in and their budget.
select a.name as actor_name, m.title, f.budget
from actors a
join movie_actor ma on a.actor_id = ma.actor_id
join movies m on ma.movie_id = m.movie_id
join financials f on m.movie_id = f.movie_id
order by a.name, m.title;

# 2) Show movie titles, actor names, and revenue (joining movies, actors, movie_actor, financials).
select m.title, a.name as actor_name, f.revenue
from movies m
join movie_actor ma on m.movie_id = ma.movie_id
join actors a on ma.actor_id = a.actor_id
join financials f on m.movie_id = f.movie_id
order by m.title, a.name;

# 3) Find the top 3 highest-budget movies and list their actors.
select m.title, a.name as actor_name, f.budget
from movies m
join financials f on m.movie_id = f.movie_id
join movie_actor ma on m.movie_id = ma.movie_id
join actors a on ma.actor_id = a.actor_id
order by f.budget desc
limit 3;

# 4) Show each studio and the total revenue of its movies
select m.studio, sum(f.revenue) as total_revenue
from movies m
join financials f on m.movie_id = f.movie_id
group by m.studio
order by total_revenue desc;
