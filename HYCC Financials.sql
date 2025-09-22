select * from financials;

# HAVING 

# 1) Find the total revenue grouped by currency, but only include currencies where total revenue is more than 1000.
select  currency, sum(revenue) as total_revenue 
from financials
group by currency
having total_revenue>1000
order by total_revenue desc;

# 2) Find the average budget of movies grouped by unit, but only include units with an average budget greater than 500.
select unit, round(avg(budget),2) as avg_budget
from financials
group by unit
having avg(budget)>500
order by avg_budget desc;

# 3) Count the number of movies per unit, but only show units with more than 5 movies.
select unit, count(*) as cnt
from financials
group by unit
having cnt>5
order by cnt desc;

# CALCULATED COLUMNS

# 4) Show movie_id, budget, revenue, and a calculated column Profit = (revenue - budget).
select movie_id, budget, revenue, (revenue-budget) as Profit
from financials;

# 5) Show movie_id, budget, revenue, and a calculated column Profit_Percentage = ((revenue - budget) / budget) * 100.
select movie_id, budget, revenue, 
round(((revenue-budget)/budget)*100,2) as Profit_Percentage
from financials;

# 6) Find the average profit per unit.
select unit, round(avg(revenue-budget),2) as avg_profit
from financials
group by unit
order by avg_profit desc;

# 7) Find the highest and lowest revenue per currency and calculate the difference as Revenue_Range.
select currency,
max(revenue) as max_rev,
min(revenue) as min_rev, 
(max(revenue)-min(revenue)) as Revenue_range
from financials
group by currency
order by Revenue_range desc;


