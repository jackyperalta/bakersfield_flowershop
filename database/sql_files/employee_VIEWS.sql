-- inventory report
DROP VIEW IF EXISTS inventoryOnHand_view;
CREATE VIEW inventoryOnHand_view AS
SELECT coalesce(refills.product_id, contains.product_id, flower_product.product_id) product_id, flower_product.product_name,
refills.quantity_item AS quantity,
coalesce(refills.quantity_item, 0) - coalesce(contains.quantity_item, 0) available,
flower_product.purchase_price AS unit_price
FROM (SELECT product_id, sum(quantity_item) quantity_item FROM refills GROUP BY product_id) refills
FULL JOIN (SELECT product_id, sum(quantity_item) quantity_item FROM contains GROUP BY product_id) contains ON refills.product_id = contains.product_id
RIGHT JOIN flower_product ON refills.product_id = flower_product.product_id
ORDER BY product_id;

-- sales report
DROP VIEW IF EXISTS salesReport_view;
CREATE VIEW salesReport_view AS
SELECT flower_product.product_name, contains.quantity_item, contains.point_of_sale_price
FROM (SELECT product_id, sum(quantity_item) quantity_item, sum(point_of_sale_price) point_of_sale_price FROM contains GROUP BY product_id) contains
INNER JOIN flower_product ON contains.product_id = flower_product.product_id
ORDER BY product_name;

-- for recent orders table
DROP VIEW IF EXISTS recent_orders_view; 
CREATE VIEW recent_orders_view AS
SELECT product_order.p_order_number, 
customer.fname || ' ' || customer.lname AS customer_name,
TO_CHAR(product_order.order_time, 'YYYY-MM-DD HH24:MI:SS') AS time_of_purchase,
flower_product.product_name, quantity_item, contains.point_of_sale_price,
order_status.status
FROM product_order
INNER JOIN contains ON product_order.p_order_number = contains.p_order_number
INNER JOIN customer ON product_order.customer_id = customer.customer_id
INNER JOIN flower_product ON contains.product_id = flower_product.product_id
INNER JOIN order_status ON product_order.status_id = order_status.status_id
WHERE status = 'new order'
ORDER BY time_of_purchase;

-- for packages table
DROP VIEW IF EXISTS pendingDelivery_view;
CREATE VIEW pendingDelivery_view AS
SELECT package.package_id, TO_CHAR(expected_time, 'YYYY-MM-DD HH24:MI:SS') AS expected_delivery_time, 
order_status.status
FROM package
INNER JOIN product_order ON package.p_order_number = product_order.p_order_number
INNER JOIN order_status ON order_status.status_id = product_order.status_id
WHERE product_order.status_id >= 4 AND product_order.status_id <= 8 AND product_order.status_id != 6
order by expected_delivery_time;

-- for my supply purchases table
DROP VIEW IF EXISTS mySupplyOrders_view;
CREATE VIEW mySupplyOrders_view AS
SELECT supply_purchase_order.supply_purchase_id,
TO_CHAR(supply_purchase_order.supply_purchase_time, 'YYYY-MM-DD HH24:MI:SS') AS time_of_supply_purchase, 
supplier.vendor_name
FROM supply_purchase_order
FULL JOIN supplier ON supply_purchase_order.supply_id = supplier.supply_id
FULL JOIN refills ON supply_purchase_order.supply_purchase_id = refills.supply_purchase_id
WHERE employee_id = 1
ORDER BY time_of_supply_purchase;



