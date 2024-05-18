SELECT Clientes.customer_unique_id AS idUnicoCliente,
	   Clientes.customer_city AS Cidade,
	   Clientes.customer_state AS Estado,
	   SUM(Pagamentos.payment_value) AS ValorTotalCompras 
	
FROM olist_orders_dataset AS Pedidos
JOIN olist_customers_dataset AS Clientes ON Pedidos.customer_id = Clientes.customer_id
JOIN olist_order_payments_dataset AS Pagamentos ON Pedidos.order_id = Pagamentos.order_id


GROUP BY Clientes.customer_id 
ORDER BY ValorTotalCompras DESC
LIMIT 10;