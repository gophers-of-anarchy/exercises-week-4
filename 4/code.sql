-- Section1
    create index created_at_index
    on orders (created_at, total);
-- Section2
    create index index_name
    on orders (user_id, created_at, total);
-- Section3
    Your third query here