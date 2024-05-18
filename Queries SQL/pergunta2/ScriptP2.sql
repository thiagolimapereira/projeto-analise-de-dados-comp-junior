SELECT Clientes.customer_state AS Estado, 
	ROUND( AVG(JULIANDAY(Pedidos.order_delivered_customer_date) - JULIANDAY(Pedidos.order_purchase_timestamp)), 2) AS TempoMedioEntrega_DIAS
	
FROM olist_orders_dataset AS Pedidos
JOIN olist_customers_dataset AS Clientes
ON Pedidos.customer_id = Clientes.customer_id

WHERE Pedidos.order_status = "delivered"

GROUP BY Estado 
ORDER BY TempoMedioEntrega_DIAS DESC;
