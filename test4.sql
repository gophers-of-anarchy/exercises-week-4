
-- Section1
create index orders_created_at_total_idx on orders (created_at, total)
-- Section2

-- Section3
     WITH recursive Listdates AS (
        SELECT (SELECT DATE(MIN(ordername.created_at)) from orders ordername) AS date
        UNION ALL
        SELECT date + INTERVAL 1 DAY
        FROM Listdates
        WHERE date < (SELECT DATE(MAX(ordername.created_at)) from orders ordername)
    )
    SELECT
        dates.date AS created_at,
        COALESCE(ordername.total, 0.00) AS total
    FROM Listdates dates
        LEFT JOIN (
            SELECT
                DATE(created_at) AS date,
                SUM(total) AS total
            FROM orders
            GROUP BY date           
    ) ordername ON dates.date = ordername.date;