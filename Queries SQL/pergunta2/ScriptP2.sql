-- Seleciona o estado do cliente e o tempo médio de entrega em dias, arredondado para 2 casas decimais
SELECT 
	Clientes.customer_state AS Estado, 
	ROUND(AVG(JULIANDAY(Pedidos.order_delivered_customer_date) - JULIANDAY(Pedidos.order_purchase_timestamp)), 2) AS TempoMedioEntrega_DIAS

-- Especifica as tabelas de onde os dados serão extraídos
FROM olist_orders_dataset AS Pedidos
-- Junta a tabela de pedidos com a tabela de clientes com base no customer_id
JOIN olist_customers_dataset AS Clientes ON Pedidos.customer_id = Clientes.customer_id

-- Filtra os resultados para incluir apenas os pedidos com status "delivered"
WHERE Pedidos.order_status = "delivered"

-- Agrupa os resultados pelo estado do cliente
GROUP BY Estado

-- Ordena os resultados pelo tempo médio de entrega em ordem decrescente
ORDER BY TempoMedioEntrega_DIAS DESC;