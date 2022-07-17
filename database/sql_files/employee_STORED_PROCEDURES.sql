-- -- insert new flower product
-- CREATE OR REPLACE PROCEDURE
-- insert_flower_product (
-- VARCHAR(24),
-- decimal(12,2),
-- VARCHAR(50),
-- DECIMAL(4,2),
-- VARCHAR(24),
-- VARCHAR(255))
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     insert into flower_product(product_name,
--      sell_price, color, length, description )
--      values ($1, $2, $3, $4, $5);
-- END;
-- $$;

-- -- insert new in-store purchase
-- CREATE OR REPLACE PROCEDURE
-- insert_new_order (
-- timestamp,
-- integer,
-- integer,
-- integer,
-- integer
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     insert into product_order(order_time, customer_id,
--      status_id, employee_id, address_id)
--      values ($1, $2, $3, $4, $5);
-- END;
-- $$;

-- -- insert new supply order
-- CREATE OR REPLACE PROCEDURE
-- insert_supply_order(
-- timestamp,
-- integer,
-- integer
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     insert into supply_purchase_order(supply_purchase_time,
--      employee_id, supply_id)
--      values ($1, $2, $3);
-- END;
-- $$;

-- -- delete flower product
-- CREATE OR REPLACE PROCEDURE
-- remove_flower_product(
-- integer
-- )
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     DELETE FROM flower_product
--     WHERE product_id = $1;
-- END;
-- $$;
-- PROCEDURE or FUNCTION
CREATE PROCEDURE SelectAllPackages
AS
SELECT * FROM packages
GO;