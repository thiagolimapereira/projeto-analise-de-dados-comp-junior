SELECT 
    CategoriaDeProduto,
    CASE WHEN VendasMarço = 0 THEN '0 Vendas em Março' ELSE (CAST(ROUND(((VendasAbril - VendasMarço) * 100.0 / VendasMarço), 2) AS TEXT) || '%') END AS VariacaoMarcoAbril,
    CASE WHEN VendasAbril = 0 THEN '0 Vendas em Abril' ELSE (CAST(ROUND(((VendasMaio - VendasAbril) * 100.0 / VendasAbril), 2) AS TEXT) || '%') END AS VariacaoAbrilMaio,
    CASE WHEN VendasMaio = 0 THEN '0 Vendas em Maio' ELSE (CAST(ROUND(((VendasJunho - VendasMaio) * 100.0 / VendasMaio), 2) AS TEXT) || '%') END AS VariacaoMaioJunho,
    CASE WHEN VendasJunho = 0 THEN '0 Vendas em Junho' ELSE (CAST(ROUND(((VendasJulho - VendasJunho) * 100.0 / VendasJunho), 2) AS TEXT) || '%') END AS VariacaoJunhoJulho,
    CASE WHEN VendasJulho = 0 THEN '0 Vendas em Julho' ELSE (CAST(ROUND(((VendasAgosto - VendasJulho) * 100.0 / VendasJulho), 2) AS TEXT) || '%') END AS VariacaoJulhoAgosto,
    CASE WHEN VendasAgosto = 0 THEN '0 Vendas em Agosto' ELSE (CAST(ROUND(((VendasSetembro - VendasAgosto) * 100.0 / VendasAgosto), 2) AS TEXT) || '%') END AS VariacaoAgostoSetembro
    
FROM (
    SELECT
        Produtos.product_category_name AS CategoriaDeProduto,
        COUNT(CASE WHEN Datas.order_purchase_timestamp >= '2018-03-01' AND Datas.order_purchase_timestamp < '2018-04-01' THEN 1 END) AS VendasMarço,
		COUNT(CASE WHEN Datas.order_purchase_timestamp >= '2018-04-01' AND Datas.order_purchase_timestamp < '2018-05-01' THEN 1 END) AS VendasAbril,
		COUNT(CASE WHEN Datas.order_purchase_timestamp >= '2018-05-01' AND Datas.order_purchase_timestamp < '2018-06-01' THEN 1 END) AS VendasMaio,
		COUNT(CASE WHEN Datas.order_purchase_timestamp >= '2018-06-01' AND Datas.order_purchase_timestamp < '2018-07-01' THEN 1 END) AS VendasJunho,
		COUNT(CASE WHEN Datas.order_purchase_timestamp >= '2018-07-01' AND Datas.order_purchase_timestamp < '2018-08-01' THEN 1 END) AS VendasJulho,
		COUNT(CASE WHEN Datas.order_purchase_timestamp >= '2018-08-01' AND Datas.order_purchase_timestamp < '2018-09-01' THEN 1 END) AS VendasAgosto,
		COUNT(CASE WHEN Datas.order_purchase_timestamp >= '2018-09-01' AND Datas.order_purchase_timestamp < '2018-10-01' THEN 1 END) AS VendasSetembro

        
    FROM olist_products_dataset AS Produtos
    JOIN olist_order_items_dataset AS Pedidos ON Pedidos.product_id  = Produtos.product_id
    JOIN olist_orders_dataset AS Datas ON Pedidos.order_id = Datas.order_id
    
    GROUP BY Produtos.product_category_name
);
