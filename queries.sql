--Listar todos Clientes que não tenham realizado uma compra--
SELECT c.customer_id, c.first_name, c.last_name
  FROM customers c
  LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

--Listar os Produtos que não tenham sido comprados--
SELECT p.product_id, p.product_name
  FROM products p
  LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

--Listar os Produtos sem Estoque--
SELECT p.product_id, p.product_name
  FROM products p
  LEFT JOIN stocks s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
  HAVING COALESCE(SUM(s.quantity), 0) = 0;
