-------------table that provides the following details: actor's first and last name combined as full_name, film title, film description and length of the movie.-------
select  concat(first_name,' ',last_name),title,description,length from 
actor
join 
film_actor
on actor.actor_id = film_actor.actor_id
join 
film 
on film_actor.film_id =film.film_id
------------query that creates a list of actors and movies where the movie length was more than 60 minutes.------
select  concat(first_name,' ',last_name),length from 
actor
join 
film_actor
on actor.actor_id = film_actor.actor_id
join 
film 
on film_actor.film_id =film.film_id
where length>60
-------------------------------Write a query that captures the actor id, full name of the actor, and counts the number of movies each actor has made. * (HINT: Think about whether you should group by actor id or the full name of the actor.*) Identify the actor who has made the maximum number movies.------------------------------------------
select actor.actor_id,concat(first_name,' ',last_name),count(film.film_id)   from 
actor 
join 
film_actor  
on actor.actor_id = film_actor.actor_id
join 
film 
on film_actor.film_id =film.film_id
group by 1,2
order by 3 desc
