-- Seleciona o ID do vendedor, o prefixo do código ZIP, a cidade o estado do vendedor a o número de pedidos cancelados
SELECT 
    PedidoVendedor.seller_id AS idVendedor,
    DadosVendedor.seller_zip_code_prefix AS PrefixoCodigoZip,
    DadosVendedor.seller_city AS CidadeVendedor,
    DadosVendedor.seller_state AS EstadoVendedor,
    COUNT(CASE WHEN PedidoVendedor.seller_id = PedidoVendedor.seller_id AND DadosPedido.order_status = 'canceled'  THEN 1 END) AS QuantidadePedidosCancelados

-- Especifica as tabelas de onde os dados serão extraídos
FROM olist_orders_dataset AS DadosPedido
-- Junta a tabela de pedidos com a tabela de itens de pedido com base no order_id
JOIN olist_order_items_dataset AS PedidoVendedor ON DadosPedido.order_id = PedidoVendedor.order_id
-- Junta a tabela de pedidos com a tabela de vendedores com base no seller_id
JOIN sellers AS DadosVendedor ON PedidoVendedor.seller_id = DadosVendedor.seller_id 

-- Agrupa os resultados pelo ID do vendedor, prefixo do código ZIP, cidade e estado
GROUP BY 
    PedidoVendedor.seller_id, 
    DadosVendedor.seller_zip_code_prefix, 
    DadosVendedor.seller_city, 
    DadosVendedor.seller_state

-- Ordena os resultados pela quantidade de pedidos cancelados em ordem decrescente   
ORDER BY QuantidadePedidosCancelados DESC

-- Limita o resultado aos top 5 vendedores com mais pedidos cancelados
Limit 5;