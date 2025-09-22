select * from movies;
select * from financials;
# JOINS
# default join is inner join - only common records basically union
select 
movies.movie_id, title,budget,revenue,currency,unit
from movies
join financials
on movies.movie_id=financials.movie_id;

select 
m.movie_id, title,budget,revenue,currency,unit
from movies m
join financials f
on m.movie_id=f.movie_id;

# LEFT JOIN - left table values and displayed along with union
select
m.movie_id,title,budget,revenue,currency,unit
from movies m
left join financials f
on m.movie_id=f.movie_id;

# RIGHT JOIN - right table values and displayed along with union
select 
f.movie_id,title,budget,revenue, currency, unit
from movies m
right join financials f
on m.movie_id=f.movie_id;

# FULL JOIN - all values are displayed, adding left and right join using union
select 
m.movie_id, title,budget,revenue,currency, unit
from movies m left join  financials f on m.movie_id=f.movie_id

union

select
f.movie_id,title,budget,revenue,currency,unit
from movies m right join financials f on m.movie_id=f.movie_id;


# USING 
select
movie_id,title, budget,revenue,currency, unit
from movies
right join financials
using (movie_id);



