-- Seleciona o estado do cliente e calcula a relação número de pedidos/tempo médio de entrega
SELECT 
	Clientes.customer_state AS Estado, 
	ROUND(COUNT(Pedidos.order_id) / AVG(JULIANDAY(Pedidos.order_delivered_customer_date) - JULIANDAY(Pedidos.order_purchase_timestamp)), 5) AS NumeroPedidos_por_TempoMedioDeEntrega
	
-- Especifica as tabelas de onde os dados serão extraídos	
FROM olist_orders_dataset AS Pedidos
-- Junta a tabela de pedidos com a tabela de clientes com base no customer_id
JOIN olist_customers_dataset AS Clientes ON Pedidos.customer_id = Clientes.customer_id

-- Filtra os pedidos para considerar apenas os entregues
WHERE Pedidos.order_status = "delivered"

-- Agrupa os resultados pelo estado do cliente
GROUP BY Estado 

-- Ordena os resultados pela relação em ordem decrescente
ORDER BY NumeroPedidos_por_TempoMedioDeEntrega DESC;