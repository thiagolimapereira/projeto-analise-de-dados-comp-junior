-- Seleciona o ID único do cliente, cidade, estado, valor total das compras e a soma os valores dos pagamentos
SELECT 
	Clientes.customer_unique_id AS idUnicoCliente,
	Clientes.customer_city AS Cidade,
	Clientes.customer_state AS Estado,
	SUM(Pagamentos.payment_value) AS ValorTotalCompras

-- Especifica as tabelas de onde os dados serão extraídos
FROM olist_orders_dataset AS Pedidos
-- Junta a tabela de pedidos com a tabela de clientes com base no customer_id
JOIN olist_customers_dataset AS Clientes ON Pedidos.customer_id = Clientes.customer_id
-- Junta a tabela de pedidos com a tabela de pagamentos com base no order_id
JOIN olist_order_payments_dataset AS Pagamentos ON Pedidos.order_id = Pagamentos.order_id

-- Agrupa os resultados pelo ID do cliente
GROUP BY Clientes.customer_id
-- Ordena os resultados pelo valor total das compras em ordem decrescente
ORDER BY ValorTotalCompras DESC
-- Limita o resultado aos top 10 clientes em termos de valor gasto
LIMIT 10;