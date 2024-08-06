-------- query that displays a table with 4 columns: actor's full name, film title, length of movie, and a column name "filmlen_groups" that classifies movies based on their length. Filmlen_groups should include 4 categories: 1 hour or less, Between 1-2 hours, Between 2-3 hours, More than 3 hours-------
select concat(first_name,' ',last_name) ,length,film.title
,case
when 	length <=60 then '1 hour or less'
when 	length between 60 and 120 then 'between 1-2 hour'
when 	length between 120 and 180 then '2-3 hour'
when 	length >180  then 'more than 3 hour'
end as category
from 
actor
join 
film_actor
on actor.actor_id = film_actor.actor_id
join 
film 
on film_actor.film_id =film.film_id

order by 2

------------------------create a count of movies in each of the 4 filmlen_groups: 1 hour or less, Between 1-2 hours, Between 2-3 hours, More than 3 hours.------------------------
select  
case
when 	length <=60 then '1 hour or less'
when 	length between 60 and 120 then 'between 1-2 hour'
when 	length between 120 and 180 then '2-3 hour'
when 	length >180  then 'more than 3 hour'
end as category
,count(*)
from 
actor
join 
film_actor
on actor.actor_id = film_actor.actor_id
join 
film 
on film_actor.film_id =film.film_id
group by 1
order by 2