select DATE_PART('month',rental_date) AS rental_month, 
       DATE_PART('year', rental_date) AS rental_year,
	   store.store_id,count(rental_id)
from 
rental
join staff 
on rental.staff_id =staff.staff_id
join store 
on staff.store_id = store.store_id
group by 1,2,3
-----------------------------------------
select concat(first_name,' ',last_name) fullname ,Date_Trunc('month', payment_date) AS StartOfMonth, sum(amount) tot_amount,count(payment_id) count_amount from
customer 
join 
payment
on customer.customer_id = payment.customer_id
group by 1,2
 order by 1,2
--------------------------------------------------
select sub.StartOfMonth,sub.fullname,sub.tot_amount
,LEAD(tot_amount) OVER(PARTITION BY fullname ORDER BY StartOfMonth)
 ,LEAD(tot_amount)OVER(PARTITION BY fullname ORDER BY StartOfMonth) - tot_amount AS lead_dif
from
(select concat(first_name,' ',last_name) fullname ,Date_Trunc('month', payment_date) AS StartOfMonth, sum(amount) tot_amount,count(payment_id) count_amount from
customer
join 
payment
on customer.customer_id = payment.customer_id
group by 1,2
 order by 1,2)sub
 where fullname='Eleanor Hunt'