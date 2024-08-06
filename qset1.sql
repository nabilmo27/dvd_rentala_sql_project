
---------------------------------------------------reate a query that lists each movie, the film category it is classified in, and the number of times it has been rented out--------------------------------------------------------------------
select title,name,count(rental_id)as rental_count
from
category 
join film_category
on category.category_id =film_category.category_id
join film
on  film_category.film_id=film.film_id
join inventory 
on film.film_id =inventory.film_id
join rental 
on inventory.inventory_id= rental.inventory_id
group by 2,1
order by 2
-------------------------the length of rental duration of these family-friendly movies compares to the duration that all movies are rented for. Can you provide a table with the movie titles and divide them into 4 levels (first_quarter, second_quarter, third_quarter, and final_quarter) based on the quartiles (25%, 50%, 75%) of the rental duration for movies across all categories? Make sure to also indicate the category that these family-friendly movies fall into.--------------------------------------------
select title,name,rental_duration,ntile(4)over(order by rental_duration)
from
category 
join film_category
on category.category_id =film_category.category_id
join film
on  film_category.film_id=film.film_id
WHERE name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
order by quarter

-------table with the family-friendly film category, each of the quartiles, and the corresponding count of movies within each combination of film category for each corresponding rental duration category.
select name,quarter,count(name)
from
( select title,name,rental_duration,ntile(4)over(order by rental_duration)quarter
from
category 
join film_category
on category.category_id =film_category.category_id
join film
on  film_category.film_id=film.film_id
WHERE name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
 )sub
 group by 
 1,2
 
 
 
 
 
 
 
 
 
 