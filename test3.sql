-- Section1
select name, phone
 from customers
inner join orders on orders.customer_id = customers.id
group by customers.id
order by count(customers.id) desc limit 1




select orders.rate,orders.restaurant_food_id from foods
join restaurant_foods on restaurant_foods.food_id = foods.id
join orders on orders.restaurant_food_id = restaurant_foods.restaurant_id
group by orders.restaurant_food_id
order by count(orders.restaurant_food_id) 

select * from orders

group by orders.restaurant_food_id
order by count(orders.restaurant_food_id) 


select rate, restaurant_food_id, count(restaurant_food_id) 
 from orders
 join restaurant_foods on restaurant_foods.id = orders.restaurant_food_id
 GROUP BY id;
 
 sum(rate) as smes, count(orders.restaurant_food_id)

