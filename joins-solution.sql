-- Base Mode --

-- 1. Get all customers and their addresses.
SELECT "customers"."first_name", 
"customers"."last_name", 
"addresses"."street", 
"addresses"."city", 
"addresses"."state", 
"addresses"."zip",
"addresses"."address_type" FROM "customers"
JOIN "addresses" ON "addresses"."customer_id"="customers"."id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT "orders"."id" AS "order_id", 
"orders"."order_date",
"line_items"."quantity",
"products"."description" FROM "orders"
JOIN "line_items" ON "line_items"."order_id"="orders"."id"
JOIN "products" ON "line_items"."product_id"="products"."id";

-- 3. Which warehouses have cheetos?
SELECT "warehouse"."warehouse" FROM "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id"="products"."id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id"="warehouse"."id"
WHERE "products"."description" = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse" FROM "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id"="products"."id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id"="warehouse"."id"
WHERE "products"."description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT("orders"."id"), "customers"."first_name" FROM "customers"
JOIN "addresses" ON "addresses"."customer_id"="customers"."id"
JOIN "orders" ON "orders"."address_id"="addresses"."id"
GROUP BY "customers"."first_name";

-- 6. How many customers do we have?
SELECT COUNT(*)FROM "customers";

-- 7. How many products do we carry?
SELECT COUNT(*)FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand") AS "total_diet_pepsi_on_hand" FROM "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id"="products"."id"
WHERE "products"."description"='diet pepsi';