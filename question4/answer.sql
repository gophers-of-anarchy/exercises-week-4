-- Section1
create index orders_created_at_total_idx on orders (created_at, total)
-- Section2
create index orders_user_id_created_at_total_idx on orders (user_id, created_at, total)
-- Section3
SELECT DATE (created_at), SUM(total)
FROM orders
GROUP BY year(created_at), month(created_at), day(created_at)
ORDER BY created_at