select * from actors;
# HAVING
# 1) Find the number of actors born in each year, but only show years with more than 2 actors.
select  birth_year,count(*) as cnt
from actors 
group by birth_year
having count(*)>2
order by cnt desc;

 # 2) Find the average birth year of actors grouped by decade, but only include decades with at least 5 actors.
select 
 (birth_year div 10)* 10 as birth_decade,
 round(avg(birth_year),0) as avg_year,
 count(*) as cnt
 from actors
 group by birth_decade
 having count(*) >=5
 order by birth_decade;
 
 # 3) Count the number of actors per birth year and only show those years where actors are born before 1970 and count > 1.
 select
 birth_year,count(*) as cnt
 from actors
 group by birth_year
 having birth_year<1970 and cnt>1
 order by cnt desc;
 
 # CALCULATED COLUMNS
 
 # 4) Show actor name and a calculated column Age_in_2025 = (2025 - birth_year).
 select name,(2025-birth_year) as Age_in_2025 from actors;
 
 # 5) Show actor name and a calculated column Century_Born that says "20th Century" if birth_year < 2000, otherwise "21st Century".
 select *,
 if(birth_year<2000,"20th Century","21st Century") as Century_born
 from actors;
 
 #6) Count the number of actors grouped by decade of birth (calculated column Birth_Decade).
 select 
 (birth_year div 10)* 10 as Birth_Decade,count(*) as cnt 
 from actors
 group by Birth_Decade
 order by Birth_Decade desc;
 

