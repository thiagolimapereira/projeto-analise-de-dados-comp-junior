SELECT PedidoVendedor.seller_id AS idVendedor,
DadosVendedor.seller_zip_code_prefix AS PrefixoCodigoZip,
DadosVendedor.seller_city AS CidadeVendedor,
DadosVendedor.seller_state AS EstadoVendedor,
COUNT(CASE WHEN PedidoVendedor.seller_id = PedidoVendedor.seller_id AND DadosPedido.order_status = 'canceled'  THEN 1 END) AS QuantidadePedidosCancelados

FROM olist_orders_dataset AS DadosPedido
JOIN olist_order_items_dataset AS PedidoVendedor ON DadosPedido.order_id = PedidoVendedor.order_id
JOIN sellers AS DadosVendedor ON PedidoVendedor.seller_id = DadosVendedor.seller_id 

GROUP BY PedidoVendedor.seller_id, DadosVendedor.seller_zip_code_prefix , DadosVendedor.seller_city, DadosVendedor.seller_state
ORDER BY QuantidadePedidosCancelados DESC
Limit 5;