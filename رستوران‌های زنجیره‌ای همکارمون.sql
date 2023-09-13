-- Section1
    SELECT c.name, c.phone FROM customers c
        JOIN orders o ON c.id = o.customer_id
    GROUP BY c.id
    ORDER BY COUNT(*) DESC
    LIMIT 1;
-- Section2
    select foods.id, foods.name from (
        select f.*, avg(o.rate) rate from foods f
            join restaurant_foods rf on f.id = rf.food_id
            join orders o on rf.id = o.restaurant_food_id
        group by rf.food_id
    ) foods
    order by foods.rate DESC, foods.id limit 10;
-- Section3
    select rest.id, rest.name from (
        select r.*, avg(o.rate) rate from restaurants r
            join restaurant_foods rf on r.id = rf.restaurant_id
            join orders o on rf.id = o.restaurant_food_id
        group by r.id
    ) rest
    order by rest.rate desc, rest.id limit 10;
-- Section4
    select * from (
        select c.name, c.phone from customers c
            join orders o on c.id = o.customer_id
            join restaurant_foods rf on rf.id = o.restaurant_food_id
        group by c.id
        having count(distinct rf.restaurant_id) >= 5
    ) custmrs
    order by custmrs.name;