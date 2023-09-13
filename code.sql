-- Section1
select  name,phone from customers
inner join orders on customer_id=customers.id
GROUP BY customer_id 
order by COUNT(customer_id) desc limit 1
-- Section2
select foods.id,foods.name from foods
inner join restaurant_foods on food_id=foods.id
inner join orders on restaurant_food_id=restaurant_foods.id
group by foods.id order by avg(rate) desc,foods.id asc
limit 10
-- Section3
select restaurants.id,restaurants.name from foods
inner join restaurant_foods on food_id=foods.id
inner join orders on restaurant_food_id=restaurant_foods.id
inner join restaurants on restaurants.id=restaurant_id
group by restaurants.id order by avg(rate) desc,restaurants.id asc
limit 10
-- Section4
select distinct name,phone from( select customers.name,phone,restaurant_id,dense_rank() over ( partition by customers.id order by restaurant_id desc ) as rn from customers
inner join orders on customer_id=customers.id
inner join restaurant_foods on restaurant_food_id=restaurant_foods.id
inner join restaurants on restaurant_id=restaurants.id
order by customers.name asc) ord  where rn=5
