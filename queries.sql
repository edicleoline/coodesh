--Listar todos Clientes que não tenham realizado uma compra--
SELECT c.customer_id, c.first_name, c.last_name
  FROM customers c
  LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
